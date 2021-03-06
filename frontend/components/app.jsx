var React = require('react'),
    ModalActions = require('../actions/modal_actions'),
    NavBar = require('./nav_bar'),
    CurrentUserStore = require("../stores/current_user_store"),
    CookieStore = require("../stores/cookie_store"),
    LanguagesApiUtil = require("../util/languages_api_util"),
    CookieActions = require("../actions/cookie_actions"),
    SignupModal = require("./modals/signup_modal"),
    History = require('react-router').History,
    SessionsApiUtil = require("../util/sessions_api_util");

var notInLessonsOrSkills = function () {
  var loc = window.location.hash;
  return(
    !/.*(lessons).*/.test(loc) &&
    !/.*(skill).*/.test(loc) &&
    !/.*(add).*/.test(loc) &&
    !/.*(user).*/.test(loc)
  );
};

module.exports = React.createClass({
  mixins: [History],

  componentDidMount: function () {
    this.currentUserListener =
      CurrentUserStore.addListener(function () {
        if (CurrentUserStore.isLoggedIn() && notInLessonsOrSkills()) {
          var courseId = CurrentUserStore.currentUser().current_course_id;
          var path = "/course/" + courseId;
          this.history.pushState(null, path);
        }
      }.bind(this));
    this.cookieListener =
      CookieStore.addListener(this.forceUpdate.bind(this));
    this.languageListener =
      LanguageStore.addListener(this.forceUpdate.bind(this));
    CookieActions.fetchCookiesFromBrowser();
    LanguagesApiUtil.fetchLanguages();
  },

  componentWillUnmount: function () {
    this.currentUserListener.remove();
    this.cookieListener.remove();
    this.languageListener.remove();
  },

  _handleLoginClick: function () {
    ModalActions.toggleModalDisplay("loginDropdown");
    this._hideOtherModal("languageIndexDropdown");
  },
  _handleLanguagesHover: function () {
    ModalActions.toggleModalDisplay("languageIndexDropdown");
    this._hideOtherModal("loginDropdown");
  },

  _hideOtherModal: function (modalName) {
    ModalActions.addModal(modalName);
  },

  splashView: function () {
    var children;

    if (CookieStore.cookiesHaveBeenFetched() &&
        LanguageStore.languagesHaveBeenFetched() &&
        CurrentUserStore.userHasBeenFetched()) {
        children = this.props.children;
    }

    return(
      <div className="splash-wrapper">
        <header className="splash-header-bar">
          <NavBar view="splash" />
        </header>
        {children}
      </div>
    );
  },

  fetchesCompleted: function () {
    return(
      CookieStore.cookiesHaveBeenFetched() &&
      LanguageStore.languagesHaveBeenFetched() &&
      CurrentUserStore.userHasBeenFetched()
    );
  },

  lessonView: function () {
    var children;
    if (this.fetchesCompleted()) {
      children = this.props.children;
    }

    return(
      <div className="main-wrapper">
        <SignupModal />
        <header className="header-bar">
          <NavBar view="main" />
        </header>
        <div className="main group">
          {children}
        </div>
      </div>
    );
  },

  mainView: function () {
    var children;
    if (this.fetchesCompleted()) {
      children = this.props.children;
    }

    return(
      <div className="main-wrapper">
        <SignupModal />
        <header className="header-bar">
          <NavBar view="main" />
        </header>
        <div className="main group">
          <main className="main-content box-shadowed">
            {children}
          </main>
        </div>
      </div>
    );
  },

  render: function () {
    return this.props.children;
  }
});
