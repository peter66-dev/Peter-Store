let i = 0;
const welcome = document.getElementById('welcome');
setInterval(() => {
    if (i == 12) {
        i = 0;
    }
    ++i;
    switch (i) {
        case 1:
            welcome.className = 'red';
            break;
        case 2:
            welcome.className = 'azure';
            break;
        case 3:
            welcome.className = 'blueviolet';
            break;
        case 4:
            welcome.className = 'brown';
            break;
        case 5:
            welcome.className = 'chartreuse';
            break;
        case 6:
            welcome.className = 'violet';
            break;
        case 7:
            welcome.className = 'orange';
            break;
        case 8:
            welcome.className = 'black';
            break;
        case 9:
            welcome.className = 'cadetblue';
            break;
        case 10:
            welcome.className = 'darksalmon';
            break;
        case 11:
            welcome.className = 'fuchsia';
            break;
        case 12:
            welcome.className = 'darkblue';
            break;
    }
}, 800);
try {
    const shopping = document.getElementById('shopping').innerHTML;
    if (shopping) {
        swal("Successfully", shopping, "success");
    }
} catch (error) {
    console.log(error);
}
try {
    const success_shopping_message = document.getElementById('success_shopping_message').innerHTML;
    if (success_shopping_message) {
        swal("Successfully", success_shopping_message, "success");
    }
} catch (error) {
    console.log(error);
}
try {
    const error_shopping_message = document.getElementById('error_shopping_message').innerHTML;
    if (error_shopping_message) {
        swal("Failed", error_shopping_message, "error");
    }
} catch (error) {
    console.log(error);
}