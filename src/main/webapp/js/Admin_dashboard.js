const filterSelect = document.getElementById('filterSelect');
const tableRows = document.querySelectorAll('.table_data');
const roleElement = document.querySelector('.role');
const search_input = document.querySelector('#search_input');
filterSelect.addEventListener('change', (e) => {
    const selectedRole = e.target.value;

    if (selectedRole === '1') {
        tableRows.forEach((row) => {

            if (row.getAttribute('data-table') == 2) {

                row.style.display = 'none';
            } else {
                row.style.display = 'grid';
            }

        });
    } else if (selectedRole === '2') {
        tableRows.forEach((row) => {

            if (row.getAttribute('data-table') == 1) {

                row.style.display = 'none';
            } else {
                row.style.display = 'grid';
            }

        });

    } else {
        tableRows.forEach((row) => {
            row.style.display = 'grid';
        });
    }

});
search_input.addEventListener("change", (e) => {
  tableRows.forEach((row) => {
     let email_input = row.querySelector('.email_input').textContent.toString();
     let search = e.target.value.toString();
     
     // trim spaces and remove special characters from both strings
     let emails = email_input.toLowerCase().trim().replace(/[^a-zA-Z0-9]/g, '');
     let searchs = search.toLowerCase().trim().replace(/[^a-zA-Z0-9]/g, '');
     
     if (emails.includes(searchs) || emails === searchs) {
       row.style.display = 'grid';
     }
     else {
       row.style.display = 'none';
     }
  });
 })
