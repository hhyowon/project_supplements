function preCheckID(event) {
    event.preventDefault(); // 기본 동작 방지

    const userId = document.getElementById('userid').value; // 입력한 아이디 값 가져오기

    const requestBody = { USER_ID: userId }; // JSON 데이터를 객체로 생성

    fetch(`/signup/checkDuplicateId`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestBody)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
   
.then(data => {
    console.log('파싱된 데이터:', data);
    const idMessage = document.getElementById('idMessage');
    
    if (data.result.isDuplicate === true) {
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
