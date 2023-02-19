    fetch('https://restcountries.com/v2/all')
      .then(res => {
        return res.json();
      })
      .then(data => {
        console.log(data);
      })
      .catch(error => console.log(error));