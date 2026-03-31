window.addEventListener("DOMContentLoaded", () => {
    show();
});

const data_url = 'http://127.0.0.1:5500/javascript/13.asyncronuos/employee.json';

const getJson = async () => {
    let response = await fetch(data_url);
    return response.json(); 
}

const show = async () => {
    let jsonData = await getJson();

    let output = `
        <h2>${jsonData.title}</h2>
        <table border=1>
            <tr>
                <th>NO</th>
                <th>NAME</th>
                <th>AGE</th>
                <th>DEPARTMENT</th>
            </tr>
                ${jsonData.list.map((employee,idx) => 
                    `<tr>
                        <td>${idx + 1}</td>
                        <td>${employee.name}</td>
                        <td>${employee.age}</td>
                        <td>${employee.department}</td>
                    </tr>`).join("")
                }
        </table>`;

    document.querySelector('#content').innerHTML = output;
}