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
    COMMENT: '새로운 댓글 내용',
    COMMUNITY_ID: '123', // 실제 COMMUNITY_ID 값으로 대체해야 함
    COMMENT_USER_ID: 'user123', // 실제 사용자 ID로 대체해야 함
    COMMENT_ID: '456' // 실제 COMMENT_ID 값으로 대체해야 함
};

// 댓글 작성 후 댓글 목록을 즉시 불러오기
insertCommentAndFetch(commentData.COMMUNITY_ID, commentData);

