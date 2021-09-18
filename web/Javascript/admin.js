try {
    const success_message_admin = document.getElementById('success_message_admin').innerHTML;
    if (success_message_admin) {
        swal("Successfully!", success_message_admin, "success");
    }
} catch (e) {
    console.log(e);
}
try {
    const error_message_admin = document.getElementById('error_message_admin').innerHTML;
    if (error_message_admin) {
        swal("Failed", error_message_admin, "error");
    }
} catch (e) {
    console.log(e);
}