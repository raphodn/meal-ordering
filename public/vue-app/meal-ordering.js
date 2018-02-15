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
  created: function() {
    bus.$on('refreshOrderList', this.getOrderList);
  },
  mounted: function() {
    this.getOrderList();
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
  }
});

// feedback modal
Vue.component('my-feedback-modal', {
  template: '#my-feedback-modal-template',
  data: function() {
    return {
      displayModal: 'none',
      order: {},
      feedbackPostObject: { feedbacks: [] }
    }
  },
  created: function() {
    bus.$on('showModal', this.openModal);
  },
  methods: {
    openModal: function(order) {
      this.displayModal = 'block';
      this.order = order;
    },
    rateAllMeals: function(rating) {
      this.order.order_items.forEach((item, index) => {
        this.$set(this.order.order_items[index], 'rating', rating);
      });
    },
    rateMeal: function(index, rating) {
      // this.order.order_items[index] = Object.assign({}, this.order.order_items[index], { rating: rating });
      this.$set(this.order.order_items[index], 'rating', rating);
    },
    toggleMealComment: function(index) {
      this.$set(this.order.order_items[index], 'showCommentInput', (this.order.order_items[index].showCommentInput ? !this.order.order_items[index].showCommentInput : true));
      if (!this.order.order_items[index].showCommentInput) {
        this.$set(this.order.order_items[index], 'comment', '');
      }
    },
    rateOrder: function(rating) {
      // this.order = Object.assign({}, this.order, { rating: rating });
      this.$set(this.order, 'rating', rating);
    },
    toggleOrderComment: function() {
      this.$set(this.order, 'showCommentInput', (this.order.showCommentInput ? !this.order.showCommentInput : true));
      if (!this.order.showCommentInput) {
        this.$set(this.order, 'comment', '');
      }
    },
    saveFeedback: function() {
      // add DeliveryOrder
      this.feedbackPostObject.feedbacks.push({
        ratable_id: this.order.id,
        ratable_type: 'DeliveryOrder',
        rating: this.order.rating,
        comment: this.order.comment
      });
      // add OrderItems
      this.order.order_items.forEach((item, index) => {
        this.feedbackPostObject.feedbacks.push({
          ratable_id: item.order_item_id,
          ratable_type: 'OrderItem',
          rating: item.rating,
          comment: item.comment
        });
      });
      // send feedbacks
      fetch(`/orders/${this.order.order_id}/feedbacks`, {
        method: 'POST',
        body: JSON.stringify(this.feedbackPostObject),
        headers: new Headers({
          'Content-Type': 'application/json'
        })
      })
        .then(res => res.json())
        .then((data) => {
          this.closeModal(true);
        })
        .catch((err) => {
          console.error(err);
        });
    },
    closeModal: function(saved) {
      this.feedbackPostObject = { feedbacks: [] };
      this.displayModal = 'none';
      if (saved) {
        bus.$emit('refreshOrderList');
      }
    }
  }
});


// ---------------------------------------------------------------------
// => FILTERS
// ---------------------------------------------------------------------

Vue.filter('formatDateTime', function(value) {
  if (value) {
    return value.toLocaleString(undefined, {
      weekday: 'long',
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
      weekday: 'long',
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
