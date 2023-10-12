document.addEventListener("DOMContentLoaded", function() {
    const commentForm = document.getElementById("commentForm");
    const commentInput = document.getElementById("commentInput");
    let COMMUNITY_ID = document.getElementById('communityIdHidden').value;// 값을 가져옵니다.

    commentForm.addEventListener("submit", function(e) {
        e.preventDefault();
            
        let commentText = commentInput.value;

        fetch(`/community/comment/${COMMUNITY_ID}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                COMMENT: commentText
            }),
        })
        .then(response => response.json())
        .then(data => {
             // 'result' 안에 'commentresult'를 찾습니다.
            const commentResult = data.result.commentresult;
            // 'commentresult' 안에 'resultList'를 찾습니다.
            const resultList = commentResult.resultList;
              // 'resultList'를 반복하면서 데이터에 접근합니다.
            resultList.forEach(item => {
                const COMMENT_USER_ID = item.COMMENT_USER_ID;
                const COMMENT = item.COMMENT;
                const COMMENTDATE = item.COMMENTDATE;

                // 여기서 데이터를 사용하거나 처리합니다.
            });
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
                            User ID: ${COMMENT_USER_ID}
                        </th>
                        <td style="width: 60%;">
                            Comment: ${COMMENT}
                        </td>
                        <td style="width: 20%;">
                            Comment Date: ${COMMENTDATE}
                        </td>
                    </tr>
                </tbody>
                `;

            newComment.innerHTML = content;
            document.getElementById("commentTableContainer").appendChild(newComment);
            commentInput.value = '';
        })
        .catch(error => {
            console.error("Error:", error);
        });
    });
});