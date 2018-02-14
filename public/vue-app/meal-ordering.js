// ---------------------------------------------------------------------
// => COMPONENTS
// ---------------------------------------------------------------------

// communication between components
var bus = new Vue();

// header
Vue.component('my-header', {
  template: '#my-header-template'
});

// order list
Vue.component('my-order-list', {
  template: '#my-order-list-template',
  data: function() {
    return {
      orders: [],
      loadingOrders: false,
      lastUpdated: undefined
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
    },
    openFeedbackModal: function(order) {
      bus.$emit('showModal', order);
    }
  },
  mounted: function() {
    this.getOrderList();
  }
});

// feedback modal
Vue.component('my-feedback-modal', {
  template: '#my-feedback-modal-template',
  data: function() {
    return {
      displayModal: 'none',
      currentOrder: {}
    }
  },
  created: function() {
    bus.$on('showModal', this.openModal);
  },
  methods: {
    openModal: function(order) {
      console.log('openModal', order);
      this.displayModal = 'block';
      this.currentOrder = order;
    },
    saveFeedback: function() {
      console.log('saveFeedback');
    },
    closeModal: function() {
      // this.$emit('close');
      this.displayModal = 'none';
    }
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
