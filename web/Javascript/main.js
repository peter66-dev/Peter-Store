const h1E = document.querySelectorAll(".container p")[0];
setInterval(() => {
    const i = Number.parseInt(Math.random() * 10);
    switch (i) {
        case 1:
            {
                h1E.className = 'violet';
                break;
            }
        case 2:
            {
                h1E.className = 'red';
                break;
            }
        case 3:
            {
                h1E.className = 'orange';
                break;
            }

        case 4:
            {
                h1E.className = 'azure';
                break;
            }

        case 5:
            {
                h1E.className = 'blueviolet';
                break;
            }

        case 6:
            {
                h1E.className = 'chartreuse';
                break;
            }

        case 7:
            {
                h1E.className = 'black';
                break;
            }
        case 8:
            {
                h1E.className = 'darkblue';
                break;
            }
        case 9:
            {
                h1E.className = 'fuchsia';
                break;
            }
        case 10:
            {
                h1E.className = 'darksalmon';
                break;
            }
        case 0:
            {
                h1E.className = 'cadetblue';
                break;
            }
    }
}, 500);