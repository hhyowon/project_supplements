function insertAndSelectcomment(COMMUNITY_ID, commentData) {
    // 댓글 추가 요청
    fetch(`/comment/${COMMUNITY_ID}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(commentData)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        console.log('Comment successfully added!');
        // 댓글을 성공적으로 추가한 후에 댓글 목록을 불러옴
        fetchComments(COMMUNITY_ID);
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
    });
}
// 댓글 데이터 예시
const commentData = {
    COMMENT: '${commentData.comment}',
    COMMUNITY_ID: '${commentData.COMMUNITY_ID}', // 실제 COMMUNITY_ID 값으로 대체해야 함
    COMMENTDATE : 'CURRENT_TIMESTAMP',
    COMMENT_USER_ID: '${commentData.COMMENT_USER_ID}', // 실제 사용자 ID로 대체해야 함
    COMMENT_ID: '${commentData.COMMENT_ID}' // 실제 COMMENT_ID 값으로 대체해야 함
};









for (let comment of data) {
    console.log(`COMMENT: ${comment.comment}, COMMUNITY_ID: ${comment.COMMUNITY_ID}, COMMENTDATE: 'CURRENT_TIMESTAMP', COMMENT_USER_ID: ${comment.COMMENT_USER_ID}, COMMENT_ID: ${comment.COMMENT_ID}`);

    // 각 자동차의 정보를 이용하여 동적으로 <tr> 요소 생성
    const row = document.createElement('tr');
    row.innerHTML = `
        <td>${comment.comment}</td>
        <td> ${comment.COMMUNITY_ID}</td>
        <td>'CURRENT_TIMESTAMP'</td>
        <td>${comment.COMMENT_USER_ID}</td>
        <td>${car.COMPANY_ID}</td>
    `;

    // 생성된 <tr> 요소를 테이블에 추가
    carTableBodyElement.appendChild(row);
}
// 댓글 작성 후 댓글 목록을 즉시 불러오기
insertCommentAndFetch(commentData.COMMUNITY_ID, commentData);

