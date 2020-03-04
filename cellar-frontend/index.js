
const WINESURL = "http://localhost:3000/api/v1/wines"
const REVIEWSURL = "http://localhost:3000/api/v1/reviews"
const wineCardContainer = document.querySelector(".wine-card-container") 

const review_container = document.getElementById('the-review-container')

document.addEventListener('DOMContentLoaded', () => {
   getWines()
   // addReviewForm()

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
         <img data-image="black" class='large-format' src="${wine.image}" alt="">
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
         <button id='rvw-btn' data-id='${wine.id}' class='review-btn'>Add Review</button>  
      </div><br><br>

      <div id='the-review-container'></div>


      <div class="back-from-product-page">
         <a href="#" class="back-btn">Back to ${wine.wineType} Wines</a>
      </div>

      <div id='review-div'></div>

      <div class='post-review-class' id='post-review-div'>Review</div>

    </div>

   </main>
   `
   wineCardContainer.append(winePage)

   loadReviews(wine)

   let review_button = document.getElementById('rvw-btn')
   review_button.addEventListener("click", function(e){addReviewForm(wine)})
}

function loadReviews(wine){
   // debugger
   
   fetch(REVIEWSURL)
   .then(resp=>resp.json())
   .then(reviews => {
      // debugger
      let this_wines_reviews = reviews.filter(review=> review.wine_id === wine.id)
      this_wines_reviews.forEach(review=>{ 
         // debugger
         let review_div = document.getElementById('post-review-div')
            let ul = document.createElement('ul')
            ul.className = 'review-text'
            ul.innerHTML=`
            ${review.rating}<br>
            ${review.content}<br>
            <button id='edit-review-button' class='edit-button' data-review-id=${review.id}>Edit Review</button>
            `
            review_div.append(ul)

            let edit_review_button = document.getElementById('edit-review-button')
            edit_review_button.addEventListener('click', function(e){
               let reviewContainer = document.getElementById('the-review-container')
               let reviewForm = document.createElement("FORM")
               reviewForm.id = "create-review"
               reviewForm.dataset.id = wine.id
               reviewForm.className = "add-review-form"
               reviewForm.innerHTML =`
                     <h3>Review This Wine:</h3>

                     <input id='rating-input'
                        type="integer"
                        name="rating"
                        value=""
                        placeholder="${review.rating}"
                        class="input-text"
                     />
                     <br />
                     <textarea id='review-input'
                        name="comment"
                        value=""
                        placeholder="${review.content}"
                        class="input-text"></textarea>
                     <br />
                     <input id='review-submit' data-id='${wine.id}' data-review-id='${review.id}'
                        type="submit"
                        name="submit"
                        value="Submit Review"
                        class="submit-rvw"
                     />

                  `
                  // debugger
            reviewContainer.append(reviewForm)
            let submitReview = document.getElementById('create-review')
            // debugger
            submitReview.addEventListener('submit', function(e){
               e.preventDefault()
               // debugger
               let thisWine = e.target
               // debugger
               patchReview(thisWine)
   })
            })
      })

})}

function patchReview(thisWine){
   // debugger
   let edit_review_button = document.getElementById('edit-review-button')
   let this_review_id = edit_review_button.dataset.reviewId 

   let wine_rating = parseInt(document.getElementById('rating-input').value)
   let this_review = document.getElementById('review-input').value
   let reviewDiv = document.getElementById('review-div')
   let review_ul = document.getElementsByClassName('review-text')[0]
   review_ul.innerHTML=`
      ${wine_rating}<br>
      ${this_review}<br>
      <button id='edit-review-button' class='edit-button' data-review-id='1'>Edit Review</button>`
            

   fetch(REVIEWSURL+`/${this_review_id}`,{
      method: "PATCH",
      headers: { 
         'Content-Type': 'application/json'
      },
      body: JSON.stringify({
         rating: wine_rating,
         content: this_review
      })
   })
   // .then(resp=>resp.json())
   // .then(review=> updateReview(review))
   // debugger
}

// function updateReview(review){
//    let this_review_id = review.id 
//    let found_review = document.querySelector(`button`)
//    // debugger
//    let rating_input = document.getElementById('rating-input').value
//    let comment_content = document.getElementById('review-input').value

//    review.rating = rating_input
//    review.content = comment_content
//    found_review.innerHTML=`
      
//    `

// }


function addReviewForm(wine){

      // debugger
      let reviewContainer = document.getElementById('the-review-container')
      let reviewForm = document.createElement("FORM")
      reviewForm.id = "create-review"
      reviewForm.dataset.id = wine.id

      reviewForm.className = "add-review-form"
      reviewForm.innerHTML =`
            <h3>Review This Wine:</h3>

            <input id='rating-input'
               type="integer"
               name="rating"
               value=""
               placeholder="Wine Rating"
               class="input-text"
            />
            <br />
            <textarea id='review-input'
               name="comment"
               value=""
               placeholder="What'd you think about this wine?"
               class="input-text"></textarea>
            <br />
            <input id='review-submit' data-id='${wine.id}'
               type="submit"
               name="submit"
               value="Submit Review"
               class="submit-rvw"
            />

         `
         // debugger
   reviewContainer.append(reviewForm)
   

   let submitReview = document.getElementById('create-review')
   // debugger
   submitReview.addEventListener('submit', function(e){
      e.preventDefault()
      let thisWine = e.target
      // debugger
      postReview(thisWine)
   })


}

function postReview(thisWine){
   // debugger
 let wine_rating = parseInt(document.getElementById('rating-input').value)
 let this_review = document.getElementById('review-input').value
 let reviewDiv = document.getElementById('review-div')

 reviewDiv.append(wine_rating, this_review)
 let wines_id = parseInt(thisWine.dataset.id)
//  debugger

 fetch(REVIEWSURL, {
   method: "POST",
   headers: {
      'Content-Type': 'application/json'},
   body: JSON.stringify({
      content: this_review,
      rating: wine_rating,
      wine_id: wines_id,
      user_id: 1
   })
   })
}










