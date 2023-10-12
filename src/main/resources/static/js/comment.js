// 'Enter' 키 입력 이벤트를 청취하는 부분
let commentInput = document.getElementById("commentInput");
let submitButton = document.getElementById("submitButton");
let commentTableContainer = document.getElementById('commentTableContainer');

submitButton.addEventListener('click', async () => {
    let inputValue = commentInput.value;
    try {
        // 댓글 데이터를 담은 객체를 생성
        const commentData = {
            COMMENT: inputValue,
            // 다른 필요한 데이터도 추가할 수 있음
        };

        // 서버 엔드포인트로 POST 요청 보내기
        let response = await fetch(`/comment/${COMMUNITY_ID}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(commentData)
        });

        if (response.ok) {
            console.log('댓글이 성공적으로 전송되었습니다.');

            // 서버로부터 댓글 데이터를 가져오는 요청을 보냅니다.
            let commentResponse = await fetch(`http://localhost:8080/selectAll/${COMMUNITY_ID}`);
            if (commentResponse.ok) {
                let commentData = await commentResponse.json();
                // 가져온 데이터를 사용하여 댓글 테이블을 업데이트합니다.
                let commentTableHtml = renderCommentTable(commentData);
                // 댓글을 표시할 DOM 요소를 업데이트된 HTML로 채웁니다.
                commentTableContainer.innerHTML = commentTableHtml;
            } else {
                console.error('댓글을 불러오는 중 오류가 발생했습니다.');
            }
        } else {
            console.error('댓글 전송 중 오류가 발생했습니다.');
        }
    } catch (error) {
        console.error('오류가 발생했습니다:', error);
    }
});

// 댓글 테이블을 렌더링하는 함수
function renderCommentTable(commentList) {
    let commentTableHtml = '';
    for (let i = 0; i < commentList.length; i++) {
        let comment = commentList[i];
        commentTableHtml += `
            <table class="tb tb_row" style="border: 1px solid #ececec; width: 100%;">
                <colgroup>
                    <col style="width: 20%;" />
                    <col style="width: 60%;" />
                    <col style="width: 20%;" />
                </colgroup>
                <tbody>
                    <tr style="border: 1px solid #ececec;">
                        <th scope="row" style="background-color: #eeeeee; text-align: center; width: 20%;">
                            ${comment.COMMENT_USER_ID}
                        </th>
                        <td style="width: 60%;">
                            ${comment.COMMENT}
                        </td>
                        <td style="width: 20%;">
                            ${comment.COMMENTDATE}
                        </td>
                    </tr>
                </tbody>
            </table>`;
    }
    return commentTableHtml;
}