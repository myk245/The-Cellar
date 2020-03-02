
const WINESURL = "http://localhost:3000/api/v1/wines"
const wineCardContainer = document.querySelector(".wine-card-container") 

document.addEventListener('DOMContentLoaded', () => {
   getWines()
}) //DOMContentLoaded closing


//// this function just gets the json data for all wines ////////
function getWines(){
   fetch(WINESURL)
   .then(resp=>resp.json())
   .then(filterWines)
}


////////// this function filters wines by wineType and saves to a variable, and adds event listeners to the buttons on the wine boxes at the top of the page. When button is clicked, data is passed to the loadWines function ////////////
function filterWines(wines){
   let redWines = wines.filter(wine=> wine.wineType === 'Red')
   let whiteWines = wines.filter(wine=> wine.wineType === 'White')
   let sparklingWines = wines.filter(wine=> wine.wineType === 'Sparkling')
   let roseWines = wines.filter(wine=> wine.wineType === 'Rose')

   document.addEventListener('click', function(e){
   
   if(e.target.id === 'red-btn'){
      wineCardContainer.innerHTML = ``
       loadWines(redWines)
   }
   else if(e.target.id === 'white-btn'){
      wineCardContainer.innerHTML = ``
       loadWines(whiteWines)
   }
   else if(e.target.id === 'sparkling-btn'){
      wineCardContainer.innerHTML = ``
      loadWines(sparklingWines)
   }
   else if(e.target.id === 'rose-btn'){
      wineCardContainer.innerHTML = ``
      loadWines(roseWines)
   }
})}

////// below is equivalent to your renderWines functino but i just added the foreach method here ///////

///// in the below funtion, my thinking is that we need to set the data for each individual wine to a variable. that way when we use the event listener at the botton of this function, we can pass that data through it to the next funtion. but this seems to be the wrong way to do it...//////////

//// i added a button to the wine boxes so we can have an event listener for it to show that specific wines details //////
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
   <button class='wine-btn' id='${wine.id}'
      <ul>
         ${wine.grapeVariety}
         <br>
         ${wine.wineType}
         <br>
         ${wine.notes}
         <br>
         $${wine.price}.00
      </ul>
   </button>
   `
   wineCardContainer.append(wineCard)
   
   let wineButton = document.getElementsByClassName('wine-btn')[0]
  
   wineButton.addEventListener('click', (e) => loadIndividualWine(e, wineCard))
})

/// for some reason i am having trouble figuring out how to set the wineCard button to a variable so i can say wine_card_box.addEventListener instead of document.addEventListener


} /// end of loadWines

function loadIndividualWine(e, wineCard){
   debugger

}









