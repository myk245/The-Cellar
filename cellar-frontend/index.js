const WINESURL = "http://localhost:3000/api/v1/wines"
const wineCardContainer = document.querySelector(".wine-card-container")

const getWines = function(){
   fetch(WINESURL)
   .then(function(response) {
      return response.json()
   })
   .then(function(data) {
      data.forEach(function(wine) {
         return renderWines(wine)
      })
   })
} //getWines closing 

const renderWines = function(wine) {
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
} //renderWine closing

document.addEventListener('DOMContentLoaded', () => {
   getWines()
}) //DOMContentLoaded closing



