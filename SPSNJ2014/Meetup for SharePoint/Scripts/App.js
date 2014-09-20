'use strict';

window.MeetupSP = Ember.Application.create({
  rootElement: "#app-root"
});

MeetupSP.ApplicationRoute = Ember.Route.extend({
  actions: {
    showModal: function (name, content) {
      this.controllerFor(name).set('content', content);
      this.render(name, {
        into: 'application',
        outlet: 'modal'
      });
    },
    removeModal: function () {
      this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      });
    }
  }
});

MeetupSP.Router.map(function () {
  this.route('about'); /* /about */
  this.resource('groups', function () { /* /groups */
    this.route('new'); /* /groups/new */
    this.route('edit', { /* /groups/edit */
      path: "/edit/:id" /* /groups/edit/1 */
    });
  });
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