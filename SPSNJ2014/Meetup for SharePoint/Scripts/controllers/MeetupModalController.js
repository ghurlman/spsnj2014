MeetupSP.MeetupModalController = Ember.ObjectController.extend({
  actions: {
    add: function (item) {
      window.alert(item.name);
    }
  }
});

MeetupSP.MeetingItemController = Ember.ObjectController.extend({
  writtenDate: function () {
    return "9/20/2014";
  }.property()
});