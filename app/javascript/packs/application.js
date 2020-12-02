// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// User



// Cars
/*

fetch ("https://bnyonrails.herokuapp.com/api/cars")
    .then(response => response.json())
    .then((data) => {    
        console.log(data)
    }
);
*/

// fetch ("https://api.github.com/users/aros")
//     .then(response => response.json())
//     .then((data) => {
    
//         console.log(data.login)
//     }
// );



fetch ("https://api.github.com/users/aros")
.then(response => response.json())
.then((data) => {

    console.log(data.login)
}
);

// const user_sign_in = document.querySelector('#btn_validate_login');


// var email = document.getElementById("signInUserEmail");
// var pswd  = document.getElementById("signInUserPassword");

// var login = document.getElementById("btn_validate_login");

// console.log(email)
// console.log(pswd)

// login.addEventListener("onclick" , session);

//


// function session (email , pswd) {
//     const user = { email: email, password: pswd };

// fetch("https://bnyonrails.herokuapp.com/users/sign_in" ,{
// method: "POST",
// headers: {
//     'Content-Type': 'application/json',
//   },
// body: JSON.stringify({ user })
// })
// .then(
//     function(response) {
//         if (response.status !== 200) {
//             console.log('Looks like there was a problem. Status Code: ' +
//               response.status);
//             return;
//           }

//           response.json().then(function(data) {
//             console.log(data);
//           });
//     }
// )

// };




