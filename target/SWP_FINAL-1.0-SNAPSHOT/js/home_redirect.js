/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let counter = document.querySelector('.counter');
let count = 5;


setInterval( () => {
    counter.innerHTML = count;
    count--;
},1000)