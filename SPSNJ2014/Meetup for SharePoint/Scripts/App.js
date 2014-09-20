'use strict';

window.MeetupSP = Ember.Application.create({
  rootElement: "#app-root"
});

MeetupSP.MyModalComponent = Ember.Component.extend({
  actions: {
    ok: function () {
      this.$('.modal').modal('hide');
      this.sendAction('ok');
    }
  },
  show: function () {
    this.$('.modal').modal().on('hidden.bs.modal', function () {
      this.sendAction('close');
    }.bind(this));
  }.on('didInsertElement')
});