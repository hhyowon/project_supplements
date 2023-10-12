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
            const resultList = data.commentresult.resultList;
            // 'commentresult' 안에 'resultList'를 찾습니다.
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
            document.getElementById("commentTableContainer").appendChild(newComment);
            commentInput.value = '';
        })
        .catch(error => {
            console.error("Error:", error);
        });
    });
});