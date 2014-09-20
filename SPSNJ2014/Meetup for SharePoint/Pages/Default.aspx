<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
  <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
  <script type="text/javascript" src="/_layouts/15/sp.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.3.0/handlebars.min.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/ember.js/1.7.0/ember.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <meta name="WebPartPageExpansion" content="full" />

  <!-- Add your CSS styles to the following file -->
  <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
  <link href="../Content/bootstrap.cosmo.min.css" rel="stylesheet" />

  <!-- Add your JavaScript to the following file -->
  <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
  Meetup for SharePoint
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
  <div style="padding-left: 185px; margin-top: 50px; overflow-x: hidden">
    <div id="app-root" class="container"></div>
  </div>

  <script type="text/x-handlebars">
    {{outlet}}

    {{outlet modal}}
  </script>

  <script type="text/x-handlebars" data-template-name="index">
    <div class="row">
      <div class="col-md-9">
        <form class="form-inline" role="form">
          <div class="form-group">
            <input type="text" class="form-control" id="radiusInput" placeholder="radius (miles, default 30)" style="width: 250px"/>
          </div>
          <button class="btn btn-default" type="button">Search</button>
        </form>
        <div id="searchResults" class="">
          <div class="meetupresult">
            <img class="img-circle col-md-2" src="http://placekitten.com/111/111" />
            <div class="col-md-9">
              <h3><a data-toggle="modal" data-target="#modalMeetup">Meetup Title</a></h3>
              <p>Bacon ipsum dolor sit amet rump t-bone ground round, cow venison pig pork loin strip steak chicken bresaola fatback brisket short ribs tri-tip. Ground round short ribs turducken pastrami shoulder. Capicola frankfurter jowl bacon beef ribs. Pork prosciutto beef turkey filet mignon ham short loin salami spare ribs bacon leberkas. Bresaola brisket sausage ribeye. Turducken biltong ball tip rump shoulder pastrami, prosciutto bacon meatball leberkas boudin pork loin.</p>
            </div>
          </div>
          <div class="meetupresult">
            <img class="img-circle col-md-2" src="http://placekitten.com/111/111" />
            <div class="col-md-9">
              <h3><a data-toggle="modal" data-target="#modalMeetup">Meetup Title</a></h3>
              <p>Bacon ipsum dolor sit amet rump t-bone ground round, cow venison pig pork loin strip steak chicken bresaola fatback brisket short ribs tri-tip. Ground round short ribs turducken pastrami shoulder. Capicola frankfurter jowl bacon beef ribs. Pork prosciutto beef turkey filet mignon ham short loin salami spare ribs bacon leberkas. Bresaola brisket sausage ribeye. Turducken biltong ball tip rump shoulder pastrami, prosciutto bacon meatball leberkas boudin pork loin.</p>
            </div>
          </div>
          <div class="meetupresult">
            <img class="img-circle col-md-2" src="http://placekitten.com/111/111" />
            <div class="col-md-9">
              <h3><a data-toggle="modal" data-target="#modalMeetup">Meetup Title</a></h3>
              <p>Bacon ipsum dolor sit amet rump t-bone ground round, cow venison pig pork loin strip steak chicken bresaola fatback brisket short ribs tri-tip. Ground round short ribs turducken pastrami shoulder. Capicola frankfurter jowl bacon beef ribs. Pork prosciutto beef turkey filet mignon ham short loin salami spare ribs bacon leberkas. Bresaola brisket sausage ribeye. Turducken biltong ball tip rump shoulder pastrami, prosciutto bacon meatball leberkas boudin pork loin.</p>
            </div>
          </div>
          <div class="meetupresult">
            <img class="img-circle col-md-2" src="http://placekitten.com/111/111" />
            <div class="col-md-9">
              <h3><a data-toggle="modal" data-target="#modalMeetup">Meetup Title</a></h3>
              <p>Bacon ipsum dolor sit amet rump t-bone ground round, cow venison pig pork loin strip steak chicken bresaola fatback brisket short ribs tri-tip. Ground round short ribs turducken pastrami shoulder. Capicola frankfurter jowl bacon beef ribs. Pork prosciutto beef turkey filet mignon ham short loin salami spare ribs bacon leberkas. Bresaola brisket sausage ribeye. Turducken biltong ball tip rump shoulder pastrami, prosciutto bacon meatball leberkas boudin pork loin.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="modalMeetup" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Meetup Group Title</h4>
          </div>
          <div class="modal-body">
            <h4>Next Meetups:</h4>
            <div class="meetupDetails">
              <h4>9/20/2014: Individual Meetup Title Goes Here</h4>
              <h5>Presented by John Doe</h5>
              <p>Bacon ipsum dolor sit amet rump t-bone ground round, cow venison pig pork loin strip steak chicken bresaola...</p>
              <div class="text-right">
                <button class="btn btn-success">Add</button>
              </div>
            </div>
            <div class="meetupDetails">
              <h4>9/20/2014: Individual Meetup Title Goes Here</h4>
              <h5>Presented by John Doe</h5>
              <p>Bacon ipsum dolor sit amet rump t-bone ground round, cow venison pig pork loin strip steak chicken bresaola...</p>
              <div class="text-right">
                <button class="btn btn-success">Add</button>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">OK</button>
          </div>
        </div>
      </div>
    </div>
  </script>

  <script type="text/x-handlebars" data-template-name="modalMeetup">
  </script>

</asp:Content>
