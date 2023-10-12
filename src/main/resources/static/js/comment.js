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
                        ${data.COMMENT_USER_ID}
                    </th>
                    <td style="width: 60%;">
                        ${data.COMMENT}
                    </td>
                    <td style="width: 20%;">
                        ${data.COMMENTDATE}
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