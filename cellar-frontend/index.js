
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
      // console.log(wine.id)
   let wineCard = document.createElement("div")
   wineCard.className = "wine-card"     
   wineCard.innerHTML = `
   <h4 id="wine-label">${wine.label}</h4>
   <span><em>${wine.region}</em>, ${wine.vintage}</span>
   <br>
   <img src="${wine.image}" class="wine-image"/>
   <button class='wine-btn' data-id='${wine.id}'
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
   let wineButton = wineCard.getElementsByClassName('wine-btn')[0]
   // debugger
   wineButton.addEventListener('click', (e) => loadIndividualWine(e, wine))
})
} /// end of loadWines

function loadIndividualWine(e, wine){
   // debugger
   // console.log(e.target.id)
   fetch(WINESURL + `/${e.target.dataset.id}`)
   .then(resp=>resp.json())
   .then(individWinePage)
}

function individWinePage(wine){
// debugger
   wineCardContainer.innerHTML = ``
   const winePage = document.createElement("div")
   winePage.dataset.id = `${wine.id}`
   winePage.innerHTML = `

   <main class="wine-page">

   <!-- Left Column / Wine Image -->
      <div class="left-column">
         <img data-image="black" src="${wine.image}" alt="">
      </div>

      <!-- Right Column -->
      <div class="right-column">

      <!-- Product Description -->
      <div class="product-description">
        <h1>${wine.label}</h1>
        <h3>Notes:</h3>
        <p>${wine.notes}</p>
      </div>

      <!-- Product Pricing -->
      <div class="product-price">
        <span>$${wine.price}.00</span>
        <a href="#" class="cart-btn">Add to cart</a>
      </div><br><br>

      <div class="review">
         <button class='review-btn'>Add Review</button>
      </div><br><br>



      <div class="back-from-product-page">
         <a href="#" class="back-btn">Back to ${wine.wineType} Wines</a>
      </div>

    </div>

   </main>
   `
   winePage.addEventListener('click', (e)=> addReview(e, wine))
   wineCardContainer.append(winePage)
}

function addReview(e, wine){

}








