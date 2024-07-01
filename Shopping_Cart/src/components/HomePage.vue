<template>
  <div>
    <section id="Bestsellers-section">
  <h2>Bestsellers</h2>
  <!-- Add your products list or content here -->
  <div class="product-list">
      <div
        v-for="product in products"
        :key="product.name"
        class="product-item"
        @click="redirectProduct(product.name)"
      >
        <div class="product-container" id="product-box">
          <img
            v-if="product.fileResponseDTOList && product.fileResponseDTOList[0] && product.fileResponseDTOList[0].fileByte"
            class="product-pic"
            :src="'data:image/jpeg;base64,' + product.fileResponseDTOList[0].fileByte"
            alt="Product Image"
          />
          <div class="product-info">
            <p class="product-name">{{ product.name }}</p>
            <div class="product-price">
              <p class="ori-price">{{ product.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") }} VND</p>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>

<section id="TopBrand-section">
  <h2>Top Brand</h2>
  <!-- Add your products list or content here -->
  <div class="product-list">
      <div
        v-for="product in products"
        :key="product.name"
        class="product-item"
        @click="redirectProduct(product.name)"
      >
        <div class="product-container" id="product-box">
          <img
            v-if="product.fileResponseDTOList && product.fileResponseDTOList[0] && product.fileResponseDTOList[0].fileByte"
            class="product-pic"
            :src="'data:image/jpeg;base64,' + product.fileResponseDTOList[0].fileByte"
            alt="Product Image"
          />
          <div class="product-info">
            <p class="product-name">{{ product.name }}</p>
            <div class="product-price">
              <p class="ori-price">{{ product.price }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>

<section id="Promotion-section">
  <h2>Promotion</h2>
  <!-- Add your products list or content here -->
  <div class="product-list">
      <div
        v-for="product in products"
        :key="product.name"
        class="product-item"
        @click="redirectProduct(product.name)"
      >
        <div class="product-container" id="product-box">
          <img
            v-if="product.fileResponseDTOList && product.fileResponseDTOList[0] && product.fileResponseDTOList[0].fileByte"
            class="product-pic"
            :src="'data:image/jpeg;base64,' + product.fileResponseDTOList[0].fileByte"
            alt="Product Image"
          />
          <div class="product-info">
            <p class="product-name">{{ product.name }}</p>
            <div class="product-price">
              <p class="ori-price">{{ product.price }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>
  </div>
    
  </template>
  
  <script>
  export default {
    data() {
      return {
        products: []
      };
    },
    mounted() {
      this.retrieveProducts();
    },
    methods: {
      redirectProduct(productName){
                let productUrl = './product/' + productName;
                this.$router.push(productUrl);
            },
            
            retrieveProducts(){
                const options = {method: 'GET'};
                let url = 'https://localhost/api/v1/products/search'
                
                fetch(url, options)
                .then(response => response.json())
                .then(response => {
                    this.products = response.content
                })
                .catch(err => console.error(err));
            }
    }
  };
  </script>
  
  <style>
  .product-list {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: center;
    gap: 27px;
    background-color: #f8f8f8;
    margin-right: 100px;
    margin-left: 100px;
  }
  
  .product-item {
    width: 200px;
    height: 300px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    transition: transform 0.3s, box-shadow 0.3s;
    cursor: pointer;
    text-align: center;
    padding: 20px;
  }
  
  .product-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
  
  .product-pic {
    max-width: 100%;
    max-height: 150px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 10px;
  }
  
  .product-info {
    width: 100%;
  }
  
  .product-name {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
  }
  
  .product-price .ori-price {
    font-size: 16px;
    color: #e91e63;
    font-weight: bold;
  }

  h2 {
    margin-left: 30px;
    font-size: 40px;
    font-weight: bold;
  }

  
  </style>
  