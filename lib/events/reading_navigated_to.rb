require 'caliper'

module Events

  # Navigation Event docs: https://www.imsglobal.org/sites/default/files/caliper/v1p1/caliper-spec-v1p1/caliper-spec-v1p1.html#navigationEvent
  # Required fields: id, type, actor, action, object, eventTime
  def self.readingProfileNavigatedTo(opts={})

    # Create an event of the correct type (which uses the correct default action)
    event = Caliper::Events::NavigationEvent.new
    event.eventTime = Time.now.utc.iso8601

    # set the user by translating your user object to a Caliper Person
    my_app_user = User.current(opts["user"])
    caliper_user = Caliper::Entities::Agent::Person.new(id: my_app_user.referencable_url)
    event.actor = caliper_user

    # set the object to the item that was navigated to, in this case a content page of some kind
    my_app_page = ContentPage.current(opts["page"])
    caliper_object = Caliper::Entities::Reading::Document.new(id: my_app_page.referencable_url)
    event.object = caliper_object

    event
  end
end
