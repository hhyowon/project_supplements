document.addEventListener("DOMContentLoaded", function() {
    const commentForm = document.getElementById("commentForm"); //JSP ID 값 : commentForm, 댓글 입력하고 전송요소 
    const commentInput = document.getElementById("commentInput"); //JSP ID 값 :commentInput, 댓글 입력하는 텍스트 필드
    let COMMUNITY_ID = document.getElementById('communityIdHidden').value;// 특정 커뮤니티 게시물의 ID를 가져옵니다. 이 ID는 폼 안의 숨겨진 필드에서 가져옵니다.

    commentForm.addEventListener("submit", function(e) { //commentForm이 제출될 때 실행될 코드를 정의합니다.
        e.preventDefault(); // form이 제출될 때 기본적으로 페이지 리로드되는 동작 막음
            
        let commentText = commentInput.value; 

        fetch(`/community/comment/${COMMUNITY_ID}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                COMMENT: commentText
            }),
        }) // fetch 함수를 사용해 서버에 POST 요청을 보냅니다. 이 때, 댓글 내용과 함께 게시물의 ID를 URL에 포함시킵니다.
        .then(response => response.json()) //서버로부터의 응답을 JSON 형태로 변환
        .then(data => {  // 데이터를 처리
            const resultList = data.commentresult.resultList;
            // 'commentresult' 안에 'resultList'를 찾습니다.
        
            // 컨테이너 초기화 (기존 댓글 삭제)
            const container = document.getElementById("commentTableContainer");
            container.innerHTML = '';
        
            resultList.forEach(item => {
                const COMMENT_USER_ID = item.COMMENT_USER_ID;
                const COMMENT = item.COMMENT;
                const COMMENTDATE = item.COMMENTDATE;
        
                let newComment = document.createElement("table");
                newComment.className = "tb tb_row";
                newComment.style.border = "1px solid #ececec";
                newComment.style.width = "100%";
        
                let content = `
                <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: 60%;" />
                        <col style="width: 20%;" />
                    </colgroup>
                    <tbody>
                        <tr style="border: 1px solid #ececec;">
                            <th scope="row" style="background-color: #eeeeee; text-align: center; width: 20%;">
                               ${COMMENT_USER_ID}
                            </th>
                            <td style="width: 60%;">
                               ${COMMENT}
                            </td>
                            <td style="width: 20%;">
                               ${COMMENTDATE}
                            </td>
                        </tr>
                    </tbody>
                `;
        
                newComment.innerHTML = content;
                container.appendChild(newComment);
            });
            
            commentInput.value = '';
        });
    });
});
