<template>
  <div class="product-page-container" v-if="product">
    <div class="product-image-section">
      <img class="product-pic" v-bind:src="'data:image/jpeg;base64,'+ product.fileResponseDTOList[0].fileByte" alt="Product Image">    </div>
    <div class="product-details-section">
      <h2>{{ product.name }}</h2>
      <p>Description: {{ product.description }}</p>
      <p><strong>Price:</strong> ${{ product.price }}</p>
      <input type="number" required v-model="quantity"/>
      <div v-if="quantityError">select at least 1</div>
      <button @click="addToCart()">Add to Cart</button>
    </div>
  </div>
  <div v-else>
    <h>
      404 not found
    </h>
  </div>
</template>

<script>

  import store from '../store'
  export default{
        data(){
        return {
                product: null,
                quantity:0,
                quantityError: 0

            }
        },
        created(){
          const options = {method: 'GET'};
          const url = 'https://localhost/api/v1/products/search?product-name=' + this.$route.params.name

          fetch(url, options)
          .then(response => response.json())
          .then(response => {
            this.product = response.content[0]
          })
          .catch(err => console.error(err));
        },
        methods:{
            addToCart(){
              if(this.quantity<1){
                this.quantityError = 1
                return
              }
              else{
                this.quantityError = 0;
              }

              const options = {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json',
                  Authorization: 'Bearer ' + store.getters.getToken()
                },
                body: '[{"productId":'+ this.product.id.toString() +',"quantity":'+ this.quantity.toString() +'}]'
                
              };

              fetch('https://localhost/api/v1/carts/upload', options)
                .then(response => response.json())
                .then(response => console.log(response))
                .catch(err => console.error(err));
              


            }
            
        }
    }
    
</script>

<style>
.product-page-container {
  display: flex;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.product-image-section {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}

.product-image-section img {
  max-width: 100%;
  max-height: 400px;
}

.product-details-section {
  flex: 2;
  padding: 20px;
}

.product-details-section h2 {
  text-align:left;
  font-size: 24px;
  margin-bottom: 20px;
}

.product-details-section p {
  font-size: 16px;
  margin-bottom: 10px;
}

.product-details-section button {
  padding: 10px 20px;
  background-color: #FF9900;
  border: none;
  color: white;
  cursor: pointer;
  font-size: 16px;
  border-radius: 5px;
}

h{
  font-size: 400%;
}
</style>
