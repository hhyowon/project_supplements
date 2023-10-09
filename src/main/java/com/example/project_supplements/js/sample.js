function carTableBody(data) {
    const carTableBodyElement = document.querySelector('#carTableBody');
    carTableBodyElement.innerHTML = ''; // 테이블 내용 초기화

    for (let car of data) {
        console.log(`YEAR: ${car.YEAR}, CAR_NAME: ${car.CAR_NAME}, CAR_INFOR_ID: ${car.CAR_INFOR_ID}, COMPANY_ID: ${car.COMPANY_ID}`);

        // 각 자동차의 정보를 이용하여 동적으로 <tr> 요소 생성
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${car.YEAR}</td>
            <td>${car.CAR_NAME}</td>
            <td>${car.CAR_INFOR_ID}</td>
            <td>${car.COMPANY_ID}</td>
        `;

        // 생성된 <tr> 요소를 테이블에 추가
        carTableBodyElement.appendChild(row);
    }
}

<insert id="insertcomment" parameterType="Map">
INSERT INTO comment (`COMMENT`, `COMMUNITY_ID`, `COMMENTDATE`, `COMMENT_USER_ID`,`COMMENT_ID`)
VALUES
(#{COMMENT}, #{COMMUNITY_ID}, CURRENT_TIMESTAMP, #{COMMENT_USER_ID}, #{COMMENT_ID});
</insert>