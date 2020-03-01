const WINESURL = "http://localhost:3000/api/v1/wines"
const wineCardContainer = document.querySelector(".wine-card-container")

document.addEventListener('DOMContentLoaded', () => {
   getWines()
}) //DOMContentLoaded closing

//////////////// i changed this funtion to what i posted below bc i needed to filter first and then do a forEach...there may have been a way to do this first so we can go back and look into it later again if you want :) //////////////////
// const getWines = function(){
//    fetch(WINESURL)
//    .then(function(response) {
//       return response.json()
//    })
//    .then(function(data) {
//       data.forEach(function(wine) {
//          return renderWines(wine)
//       })
//    })
// } //getWines closing 


//// this function just gets the json data for all wines ////////
function getWines(){
   fetch(WINESURL)
   .then(resp=>resp.json())
   .then(filterWines)
}

////////// this function filters wines by wineType and saves to a variable, and adds event listeners to the buttons on the wine boxes at the top of the page. When button is clicked, data is passed to the loadWines function ////////////
function filterWines(wines){

   let redWines = wines.filter(wine=> wine.wineType === 'Red')
   
   // let whiteWines = wines.filter(wine=> wine.wineType === 'White')
   // let sparklingWines = wines.filter(wine=> wine.wineType === 'Sparkling')
   // let roseWines = wines.filter(wine=> wine.wineType === 'Rose')

   document.addEventListener('click', function(e){
   
   if(e.target.id === 'red-btn'){
       loadWines(redWines)
   }
   // else if(e.target.id === 'white-btn'){
   //     loadWhites(whiteWines)
   // }
   // else if(e.target.id === 'sparkling-btn'){
   //     loadSparklings(whiteWines)
   // }
   // else if(e.target.id === 'rose-btn'){
   //     loadRoses(whiteWines)
   // }


})}

////// below is equivalent to your renderWines functino but i just added the foreach method here ///////

function loadWines(filteredwines){
   filteredwines.forEach(wine=>{ 
   const wineCard = document.createElement("div")
   wineCard.className = "wine-card"
   wineCard.dataset.id = wine.id

   wineCard.innerHTML = `
   <h4 id="wine-label">${wine.label}</h4>
   <span><em>${wine.region}</em>, ${wine.vintage}</span>
   <br>
   <img src="${wine.image}" class="wine-image"/>
   <ul>
      ${wine.grapeVariety}
      <br>
      ${wine.wineType}
      <br>
      ${wine.notes}
      <br>
      $${wine.price}.00
   </ul>
   `
   wineCardContainer.append(wineCard)
})
} /// end of loadWines





/////////// keeping what you had before in case you want to see the difference. i just added the for Each function here ///////

// const renderWines = function(wine) {
//    const wineCard = document.createElement("div")
//    wineCard.className = "wine-card"
//    wineCard.dataset.id = wine.id
//    wineCard.innerHTML = `
//    <h4 id="wine-label">${wine.label}</h4>
//    <span><em>${wine.region}</em>, ${wine.vintage}</span>
//    <br>
//    <img src="${wine.image}" class="wine-image"/>
//    <ul>
//       ${wine.grapeVariety}
//       <br>
//       ${wine.wineType}
//       <br>
//       ${wine.notes}
//       <br>
//       $${wine.price}.00
//    </ul>
//    `
//    wineCardContainer.append(wineCard)
// } //renderWine closing





