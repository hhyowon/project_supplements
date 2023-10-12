function preCheckID(event) {
    event.preventDefault(); // 기본 동작 방지

    const userId = document.getElementById('userid').value; // 입력한 아이디 값 가져오기

    const requestBody = { userId: userId }; // JSON 데이터를 객체로 생성

    fetch(`http://localhost:8080/signup/checkDuplicateId`, {// 백엔드 서버에 중복 아이디 확인을 요청하기 위해 fetch 함수사용
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestBody) // JSON 데이터를 문자열로 변환하여 본문에 추가
    })
    .then((result) => {
        if (!result.ok) {
            throw new Error('Network response was not ok');
        }
        return result.json();
    })
    .then(data => {
        console.log('파싱된 데이터:', data); // 데이터를 로그에 출력
        const idMessage = document.getElementById('idMessage');
        
        if (data.result === " ") {
            // 중복된 아이디 처리
            idMessage.textContent = '이미 사용 중인 아이디입니다.';
            idMessage.style.color = 'red';
        } else {
            // 사용 가능한 아이디 처리
            idMessage.textContent = '사용 가능한 아이디입니다.';
            idMessage.style.color = 'green';
        }
    })
    .catch(error => {
        console.error('오류 발생: ', error);
    });
}
