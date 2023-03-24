


function generateColor() {
    let r = parseInt(Math.random() * 255);
    let g = parseInt(Math.random() * 255);
    let b = parseInt(Math.random() * 255);
    return `rgb(${r},${g},${b})`
}


function cateChart(id, cateLabels=[], cateInfo = []) {
    let colors = []
    for (let i = 0; i < cateInfo.length; i++)
        colors.push(generateColor())

    const labels = Utils.months({count: cateInfo.length});
    const data = {
        labels: cateLabels,
        datasets: [{
                label: 'My First Dataset',
                data: cateInfo,
                backgroundColor: colors,
                borderColor: colors,
                borderWidth: 1
            }]
    };
    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
    };
    
     let ctx = document.getElementById(id).getContext("2d")
    
       new Chart(ctx,config)
}