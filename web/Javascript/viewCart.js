try {
    const viewcart_message = document.getElementById('viewcart_message').innerHTML;
    if (viewcart_message) {
        swal("Successfully!", viewcart_message, "success");
    }
} catch (error) {
    console.log(error);
}

try {
    const error_viewcart_message = document.getElementById('error_viewcart_message').innerHTML;
    if (error_viewcart_message) {
        swal("Failed!", error_viewcart_message, "error");
    }
} catch (error) {
    console.log(error);
}