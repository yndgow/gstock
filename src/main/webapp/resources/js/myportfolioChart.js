/*======== 11. DOUGHNUT CHART ========*/
  
  
  
  
  /*======== 16. ANALYTICS - ACTIVITY CHART ========*/
  var activity = document.getElementById("activity");
  if (activity !== null) {
    var activityData = [
      {
        first: [0, 65, 52, 115, 98, 165, 125],
        second: [45, 38, 100, 87, 152, 187, 85]
      },
      {
        first: [0, 65, 77, 33, 49, 100, 100],
        second: [88, 33, 20, 44, 111, 140, 77]
      },
      {
        first: [0, 40, 77, 55, 33, 116, 50],
        second: [55, 32, 20, 55, 111, 134, 66]
      },
      {
        first: [0, 44, 22, 77, 33, 151, 99],
        second: [60, 32, 120, 55, 19, 134, 88]
      }
    ];

    var config = {
      // The type of chart we want to create
      type: "line",
      // The data for our dataset
      data: {
        labels: [
          "4 Jan",
          "5 Jan",
          "6 Jan",
          "7 Jan",
          "8 Jan",
          "9 Jan",
          "10 Jan"
        ],
        datasets: [
          {
            label: "Active",
            backgroundColor: "transparent",
            borderColor: "rgba(82, 136, 255, .8)",
            data: activityData[0].first,
            lineTension: 0,
            pointRadius: 5,
            pointBackgroundColor: "rgba(255,255,255,1)",
            pointHoverBackgroundColor: "rgba(255,255,255,1)",
            pointBorderWidth: 2,
            pointHoverRadius: 7,
            pointHoverBorderWidth: 1
          },
          {
            label: "Inactive",
            backgroundColor: "transparent",
            borderColor: "rgba(255, 199, 15, .8)",
            data: activityData[0].second,
            lineTension: 0,
            borderDash: [10, 5],
            borderWidth: 1,
            pointRadius: 5,
            pointBackgroundColor: "rgba(255,255,255,1)",
            pointHoverBackgroundColor: "rgba(255,255,255,1)",
            pointBorderWidth: 2,
            pointHoverRadius: 7,
            pointHoverBorderWidth: 1
          }
        ]
      },
      // Configuration options go here
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: false
        },
        scales: {
          xAxes: [
            {
              gridLines: {
                display: false,
              },
              ticks: {
                fontColor: "#8a909d", // this here
              },
            }
          ],
          yAxes: [
            {
              gridLines: {
                fontColor: "#8a909d",
                fontFamily: "Roboto, sans-serif",
                display: true,
                color: "#eee",
                zeroLineColor: "#eee"
              },
              ticks: {
                // callback: function(tick, index, array) {
                //   return (index % 2) ? "" : tick;
                // }
                stepSize: 50,
                fontColor: "#8a909d",
                fontFamily: "Roboto, sans-serif"
              }
            }
          ]
        },
        tooltips: {
          mode: "index",
          intersect: false,
          titleFontColor: "#888",
          bodyFontColor: "#555",
          titleFontSize: 12,
          bodyFontSize: 15,
          backgroundColor: "rgba(256,256,256,0.95)",
          displayColors: true,
          xPadding: 10,
          yPadding: 7,
          borderColor: "rgba(220, 220, 220, 0.9)",
          borderWidth: 2,
          caretSize: 6,
          caretPadding: 5
        }
      }
    };

    var ctx = document.getElementById("activity").getContext("2d");
    var myLine = new Chart(ctx, config);

    var items = document.querySelectorAll("#user-activity .nav-tabs .nav-item");
    items.forEach(function(item, index){
      item.addEventListener("click", function() {
        config.data.datasets[0].data = activityData[index].first;
        config.data.datasets[1].data = activityData[index].second;
        myLine.update();
      });
    });
  }

  /*======== 14. CURRENT USER BAR CHART ========*/
  var cUser = document.getElementById("currentUser");
  if (cUser !== null) {
    var myUChart = new Chart(cUser, {
      type: "bar",
      data: {
        labels: [
          "1h",
          "10 m",
          "50 m",
          "30 m",
          "40 m",
          "20 m",
          "30 m",
          "25 m",
          "20 m",
          "5 m",
          "10 m"
        ],
        datasets: [
          {
            label: "signup",
            data: [15, 30, 27, 43, 39, 18, 42, 25, 13, 18, 59],
            // data: [2, 3.2, 1.8, 2.1, 1.5, 3.5, 4, 2.3, 2.9, 4.5, 1.8, 3.4, 2.8],
            backgroundColor: "#88aaf3"
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: false
        },
        scales: {
          xAxes: [
            {
              gridLines: {
                drawBorder: true,
                display: false,
              },
              ticks: {
                fontColor: "#8a909d",
                fontFamily: "Roboto, sans-serif",
                display: false, // hide main x-axis line
                beginAtZero: true,
                callback: function(tick, index, array) {
                  return index % 2 ? "" : tick;
                }
              },
              barPercentage: 1.8,
              categoryPercentage: 0.2
            }
          ],
          yAxes: [
            {
              gridLines: {
                drawBorder: true,
                display: true,
                color: "#eee",
                zeroLineColor: "#eee"
              },
              ticks: {
                fontColor: "#8a909d",
                fontFamily: "Roboto, sans-serif",
                display: true,
                beginAtZero: true
              }
            }
          ]
        },

        tooltips: {
          mode: "index",
          titleFontColor: "#888",
          bodyFontColor: "#555",
          titleFontSize: 12,
          bodyFontSize: 15,
          backgroundColor: "rgba(256,256,256,0.95)",
          displayColors: true,
          xPadding: 10,
          yPadding: 7,
          borderColor: "rgba(220, 220, 220, 0.9)",
          borderWidth: 2,
          caretSize: 6,
          caretPadding: 5
        }
      }
    });
  }
  
   /*======== 15. ANALYTICS - USER ACQUISITION ========*/
  var acquisition = document.getElementById("acquisition");
  if (acquisition !== null) {
    var acqData = [
      {
        first: [100, 180, 44, 75, 150, 66, 70],
        second: [144, 44, 177, 76, 23, 189, 12],
        third: [44, 167, 102, 123, 183, 88, 134]
      },
      {
        first: [144, 44, 110, 5, 123, 89, 12],
        second: [22, 123, 45, 130, 112, 54, 181],
        third: [55, 44, 144, 75, 155, 166, 70]
      },
      {
        first: [134, 80, 123, 65, 171, 33, 22],
        second: [44, 144, 77, 76, 123, 89, 112],
        third: [156, 23, 165, 88, 112, 54, 181]
      }
    ];

    var configAcq = {
      // The type of chart we want to create
      type: "line",

      // The data for our dataset
      data: {
        labels: [
          "4 Jan",
          "5 Jan",
          "6 Jan",
          "7 Jan",
          "8 Jan",
          "9 Jan",
          "10 Jan"
        ],
        datasets: [
          {
            label: "Via Referral",
            backgroundColor: "rgba(52, 116, 212, .2)",
            borderColor: "rgba(52, 116, 212, .7)",
            data: acqData[0].first,
            lineTension: 0.3,
            pointBackgroundColor: "rgba(52, 116, 212,0)",
            pointHoverBackgroundColor: "rgba(52, 116, 212,1)",
            pointHoverRadius: 3,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            pointStyle: "rectRounded"
          },
          {
            label: "Direct",
            backgroundColor: "rgba(255, 192, 203, .3)",
            borderColor: "rgba(255, 192, 203, .7)",
            data: acqData[0].second,
            lineTension: 0.3,
            pointBackgroundColor: "rgba(255, 192, 203, 0)",
            pointHoverBackgroundColor: "rgba(255, 192, 203, 1)",
            pointHoverRadius: 3,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            pointStyle: "rectRounded"
          },
          {
            label: "Via Social",
            backgroundColor: "rgb(178, 251, 212, .3)",
            borderColor: "rgba(178, 251, 212, .7)",
            data: acqData[0].third,
            lineTension: 0.3,
            pointBackgroundColor: "rgba(178, 251, 212, 0)",
            pointHoverBackgroundColor: "rgba(178, 251, 212, 1)",
            pointHoverRadius: 3,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            pointStyle: "rectRounded"
          }
        ]
      },

      // Configuration options go here
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: false
        },
        scales: {
          xAxes: [
            {
              gridLines: {
                display: false
              }
            }
          ],
          yAxes: [
            {
              gridLines: {
                display: true,
                color: "#eee",
                zeroLineColor: "#eee"
              },
              ticks: {
                beginAtZero: true,
                stepSize: 50,
                max: 200
              }
            }
          ]
        },
        tooltips: {
          mode: "index",
          titleFontColor: "#888",
          bodyFontColor: "#555",
          titleFontSize: 12,
          bodyFontSize: 15,
          backgroundColor: "rgba(256,256,256,0.95)",
          displayColors: true,
          xPadding: 20,
          yPadding: 10,
          borderColor: "rgba(220, 220, 220, 0.9)",
          borderWidth: 2,
          caretSize: 10,
          caretPadding: 15
        }
      }
    };

    var ctx = document.getElementById("acquisition").getContext("2d");
    var lineAcq = new Chart(ctx, configAcq);
    document.getElementById("acqLegend").innerHTML = lineAcq.generateLegend();

    var items = document.querySelectorAll(
      "#user-acquisition .nav-tabs .nav-item"
    );
    items.forEach(function (item, index) {
      item.addEventListener("click", function() {
        configAcq.data.datasets[0].data = acqData[index].first;
        configAcq.data.datasets[1].data = acqData[index].second;
        configAcq.data.datasets[2].data = acqData[index].third;
        lineAcq.update();
      });
    });
  }
  
  /*======== 16. ANALYTICS - ACTIVITY CHART ========*/
  var activity = document.getElementById("activity");
  if (activity !== null) {
    var activityData = [
      {
        first: [0, 65, 52, 115, 98, 165, 125],
        second: [45, 38, 100, 87, 152, 187, 85]
      },
      {
        first: [0, 65, 77, 33, 49, 100, 100],
        second: [88, 33, 20, 44, 111, 140, 77]
      },
      {
        first: [0, 40, 77, 55, 33, 116, 50],
        second: [55, 32, 20, 55, 111, 134, 66]
      },
      {
        first: [0, 44, 22, 77, 33, 151, 99],
        second: [60, 32, 120, 55, 19, 134, 88]
      }
    ];

    var config = {
      // The type of chart we want to create
      type: "line",
      // The data for our dataset
      data: {
        labels: [
          "4 Jan",
          "5 Jan",
          "6 Jan",
          "7 Jan",
          "8 Jan",
          "9 Jan",
          "10 Jan"
        ],
        datasets: [
          {
            label: "Active",
            backgroundColor: "transparent",
            borderColor: "rgba(82, 136, 255, .8)",
            data: activityData[0].first,
            lineTension: 0,
            pointRadius: 5,
            pointBackgroundColor: "rgba(255,255,255,1)",
            pointHoverBackgroundColor: "rgba(255,255,255,1)",
            pointBorderWidth: 2,
            pointHoverRadius: 7,
            pointHoverBorderWidth: 1
          },
          {
            label: "Inactive",
            backgroundColor: "transparent",
            borderColor: "rgba(255, 199, 15, .8)",
            data: activityData[0].second,
            lineTension: 0,
            borderDash: [10, 5],
            borderWidth: 1,
            pointRadius: 5,
            pointBackgroundColor: "rgba(255,255,255,1)",
            pointHoverBackgroundColor: "rgba(255,255,255,1)",
            pointBorderWidth: 2,
            pointHoverRadius: 7,
            pointHoverBorderWidth: 1
          }
        ]
      },
      // Configuration options go here
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: false
        },
        scales: {
          xAxes: [
            {
              gridLines: {
                display: false,
              },
              ticks: {
                fontColor: "#8a909d", // this here
              },
            }
          ],
          yAxes: [
            {
              gridLines: {
                fontColor: "#8a909d",
                fontFamily: "Roboto, sans-serif",
                display: true,
                color: "#eee",
                zeroLineColor: "#eee"
              },
              ticks: {
                // callback: function(tick, index, array) {
                //   return (index % 2) ? "" : tick;
                // }
                stepSize: 50,
                fontColor: "#8a909d",
                fontFamily: "Roboto, sans-serif"
              }
            }
          ]
        },
        tooltips: {
          mode: "index",
          intersect: false,
          titleFontColor: "#888",
          bodyFontColor: "#555",
          titleFontSize: 12,
          bodyFontSize: 15,
          backgroundColor: "rgba(256,256,256,0.95)",
          displayColors: true,
          xPadding: 10,
          yPadding: 7,
          borderColor: "rgba(220, 220, 220, 0.9)",
          borderWidth: 2,
          caretSize: 6,
          caretPadding: 5
        }
      }
    };

    var ctx = document.getElementById("activity").getContext("2d");
    var myLine = new Chart(ctx, config);

    var items = document.querySelectorAll("#user-activity .nav-tabs .nav-item");
    items.forEach(function(item, index){
      item.addEventListener("click", function() {
        config.data.datasets[0].data = activityData[index].first;
        config.data.datasets[1].data = activityData[index].second;
        myLine.update();
      });
    });
  }
