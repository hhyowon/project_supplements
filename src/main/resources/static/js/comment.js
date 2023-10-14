document.addEventListener("DOMContentLoaded", function() {
    const commentForm = document.getElementById("commentForm");
    const commentInput = document.getElementById("commentInput");
    let COMMUNITY_ID = document.getElementById('communityIdHidden').value;

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
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(data => {
            const resultList = data.commentresult.resultList;
            const container = document.getElementById("commentTableContainer");
            container.innerHTML = '';
        
            resultList.forEach(item => {
                const COMMENT_USER_ID = item.COMMENT_USER_ID;
                const COMMENT = item.COMMENT;
                const COMMENTDATE = item.COMMENTDATE;

                let deleteButton = `
                <td style="width: 20%;">
                    <button class="deleteCommentButton" data-comment-id="${item.COMMENT_ID}" data-community-id="${item.COMMUNITY_ID}">삭제</button>
                </td>
                `;

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
                            ${deleteButton} 
                        </tr>
                    </tbody>
                `;

                newComment.innerHTML = content;
                container.appendChild(newComment);
            });
            
            commentInput.value = '';
        })
        .catch(error => {
            console.error('Fetch error: ', error);
            alert("댓글 추가 중 오류가 발생했습니다. 다시 시도해 주세요.");
        });
    });

    document.addEventListener('click', function(event) {
        if(event.target.matches('.deleteCommentButton')) {
            let commentId = event.target.getAttribute('data-comment-id');
            let communityId = event.target.getAttribute('data-community-id');

            if (confirm("댓글을 정말 삭제하시겠습니까?")) {
                fetch(`/community/deleteAndSelectSearch/${commentId}/${communityId}`, {
                    method: "DELETE"
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Network response was not ok");
                    }
                    return response.json();
                })
                .then(data => {
                    event.target.closest('table').remove();
                    window.location.reload();
                })
                
            }
        }
    });
});
