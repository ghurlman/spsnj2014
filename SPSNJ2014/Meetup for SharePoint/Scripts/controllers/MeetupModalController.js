MeetupSP.MeetupModalController = Ember.ObjectController.extend({
  actions: {
    add: function (item) {
      hostweburl = decodeURIComponent(
        getQueryStringParameter('SPHostUrl')
      );
      var context = new SP.ClientContext.get_current(); //gets the current context
      var appCtxSite = new SP.AppContextSite(context, hostweburl);
      var web = appCtxSite.get_web(); //gets the web object
      var list = web.get_lists().getByTitle("Events");

      var newEventCreateInfo = new SP.ListItemCreationInformation();
      var newEvent = list.addItem(newEventCreateInfo);
      newEvent.set_item("Location", item.venue.name);
      newEvent.set_item("Start Time", moment("9/20/2014 18:00").toDate());
      newEvent.set_item("End Time", moment("9/20/2014 20:00").toDate());
      newEvent.set_item("Description", item.description);
      newEvent.set_item("Title", item.name);
      newEvent.set_item("fAllDayEvent", false);
      newEvent.update();
      context.executeQueryAsync(function () { alert("Success"); },
        function (data, e) {
          alert("Failure");
        })
    }
  }
});

MeetupSP.MeetingItemController = Ember.ObjectController.extend({
  writtenDate: function () {
    return "9/20/2014";
  }.property()
});