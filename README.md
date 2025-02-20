# README

## Project Description

New era Lissoise (NEL) is an event management platform for an association. It allows users to create, manage, and register for various events. The application offers authentication features, role management, and an intuitive user interface for navigating and interacting with events.

## Current Features

- Here is a list of features already implemented in the application:

### User Authentication

- Signup
- Login
- Logout
- Password reset

### Event Management

- Create events
- Display events
- Register and unregister for events
- Cancel events

### Role Management

- Assign roles to users (e.g., admin)

### User Interface

- Intuitive navigation with a navigation bar
- Pages for creating and displaying events
  Contact page

### Database

Models for users, events, and registrations
Relationships between models (e.g., a user can register for multiple events)

### Checklist

Here's a checklist based on the provided criteria to verify what is already in place and what still needs to be implemented:

### Product Jury

- 🔄 The homepage clearly explains what the application offers.
  Needs verification to ensure clarity for new users.

- [✅] The main functionality of the application is usable.
  Users can create, manage, and register for events.

- [✅] Navigation on the site is simple and intuitive.
  Navigation bar and links are in place.
- [✅] The signup page only asks for email and password.
  Signup form fields are minimal.

### Technical Jury

- [✅] No inappropriate language mixes.
  Code and comments are in English.

- [✅] Models have relationships between them.
  Users, events, and registrations are related.

- [✅] The application architecture follows the REST model.
  RESTful routes are defined in config/routes.rb.

- [✅] API keys are not hardcoded in the code.
  Assuming API keys are managed securely.

- [✅] Class, model, and variable names are in English.
  Consistent naming conventions are used.

- [✅] Links use Rails helpers.
  Helpers like link_to are used.

- [🔄] Fat Model Skinny Controllers.
  Needs verification to ensure controllers are light.

- [🔄] Services are used to lighten controllers.
  Needs verification to ensure services are implemented.

- [✅] Table names are product-oriented.
  Table names like users and events are meaningful.

- [❌] Presence of a mailer.
  Mailer functionality needs to be implemented.

- [✅] Clean routes and use of nested resources.
  Routes are defined in config/routes.rb.

- [✅] Validations in models.
  Validations are present in models like User.

- [❌] APIs are wrapped in services.
  API services need to be implemented.

- [✅] Attribute types match the parameters.
  Correct data types are used in migrations.

- [✅] Migrations are clean and replicable.
  Migrations are present and can be replicated.

- [✅] Presence of a seed file.
  Seed file is present for initial data setup.

- [✅] N-N relationships use has_many through.
  Relationships are correctly defined.

### Curriculum Jury

- [🔄] Functional application in production.
  Needs deployment to production environment.

- [✅] Branching authentication system.
  Authentication system is in place.

- [❌] Functional mailer in production.
  Mailer functionality needs to be implemented.

- [❌] Use of an external API.
  External API integration needs to be implemented.

- [✅] At least two models related to each other.
  Users and events are related.

- [🔄] Component-oriented frontend.
  Needs verification to ensure components are used.

- [🔄] The 5 devise views have CSS.
  Needs verification to ensure CSS is applied.

- [🔄] The frontend is acceptable.
  Needs verification to ensure UI/UX quality.

- [🔄] The site is readable.
  Needs verification to ensure readability.

### Teamwork

- [🔄] All team members have contributed to the code.
  Needs verification through commit history.

- [🔄] Use of Trello or a similar tool for project management.
  Needs verification to ensure project management tools are used.

- [🔄] Code is hosted on GitHub or GitLab.
  Needs verification to ensure code is hosted.

- [🔄] Use of Git branches.
  Needs verification to ensure branching strategy is followed.

- [🔄] Code is commented and properly indented.
  Needs verification to ensure code quality.

- [🔄] No commits on Master.
  Needs verification to ensure branching strategy is followed.

- [🔄] Commits are frequent and explicit.
  Needs verification to ensure commit quality.

- [🔄] Commit messages are in English.
  Needs verification to ensure commit messages are in English.

- [🔄] Production pipeline is present.
  Needs verification to ensure CI/CD pipeline is set up.

- [🔄] One branch per feature.
  Needs verification to ensure branching strategy is followed.
- [🔄] Agile concepts are used in project management.
  Needs verification to ensure agile practices are followed.

- [🔄] Daily stand-ups.
  Needs verification to ensure stand-ups are conducted.

- [🔄] Equitable distribution of work.
  Needs verification to ensure work is evenly distributed.

### Roadmap

#### User Interface Improvement

- Ensure the homepage clearly explains the application.
- Simplify navigation and ensure all links work correctly.

#### Feature Completion

- Ensure all main functionalities are fully operational.
- Implement unit tests to validate functionalities.

#### Code Optimization

- Ensure the code follows best practices (Fat Model Skinny Controllers, use of services, etc.).
- Add comments and ensure the code is well-indented.

#### Deployment and Testing

- Deploy the application to production and ensure it is bug-free.
- Perform production tests to verify there are no errors or side effects.

#### Documentation and Collaboration

- Document the code and development processes.
- Use collaboration tools to manage the project and ensure equitable work distribution.
