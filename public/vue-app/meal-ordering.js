// ---------------------------------------------------------------------
// => COMPONENTS
// ---------------------------------------------------------------------

// header
Vue.component('my-header', {
  template: '#my-header-template'
});

// order list
Vue.component('my-order-list', {
  template: '#my-order-list-template',
  data: function() {
    return {
      lastUpdated: undefined,
      loadingOrders: false,
      orders: []
    }
  },
  methods: {
    getOrderList: function() {
      this.loadingOrders = true;
      // get orders
      fetch('/orders')
        .then(res => res.json())
        .then((data) => {
          this.orders = data;
          this.lastUpdated = new Date();
          this.loadingOrders = false;
        })
        .catch((err) => {
          console.error(err);
          this.loadingOrders = false;
        });
    }
  },
  mounted: function() {
    this.getOrderList();
  }
});


// ---------------------------------------------------------------------
// => FILTERS
// ---------------------------------------------------------------------

Vue.filter('formatDateTime', function(value) {
  if (value) {
    return value.toLocaleString(undefined, {
      weekday: 'short',
      day: '2-digit',
      month: '2-digit',
      year: 'numeric',
      hour: 'numeric',
      minute: '2-digit'
    });
  }
});

Vue.filter('formatDate', function(value) {
  if (value) {
    return value.toLocaleDateString(undefined, {
      weekday: 'short',
      day: '2-digit',
      month: '2-digit',
      year: 'numeric'
    });
  }
});


// ---------------------------------------------------------------------
// => APP
// ---------------------------------------------------------------------

var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
});
