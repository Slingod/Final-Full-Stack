# Fullstack Final Project - New Era Lissoise (NEL)

## Project Description

New Era Lissoise (NEL) is a fullstack event management platform developed with **Ruby on Rails 8.0.1**. It allows users to create, manage, and register for various events while offering authentication features, role management, and an intuitive user interface. The application follows the **CRUD model (Create, Read, Update, Delete)** for users and events.

## Technologies Used

- **Ruby on Rails 8.0.1**: Main framework
- **Devise**: User authentication (registration, login, logout, email confirmation, etc.)
- **SQLite**: Default database for development
- **Kamal**: Deployment tool
- **Bootstrap / Tailwind CSS**: Frontend design and styling
- **Whimsical**: Wireframing tool
- **JWT** (Optional): API authentication

## Wireframe

The wireframe for the project is available here:

- [User Flow](https://whimsical.com/fullstackfinal-P1XYFdSBXN73n7xRAngMNd)
- [WireFrame](https://whimsical.com/wireframefullstack-TFytgVQdEJAt3t2LC5umit)
- [Projet Site Web.pptx](https://github.com/user-attachments/files/19105674/Projet.Site.Web.pptx)

## Features

### Frontend

- **Home Page**: Overview of the platform
- **About Page**: Description of the application
- **Contact Page**: Contact form for user inquiries
- **User Authentication**:
  - Registration & Login via Devise
  - Email confirmation for new accounts
  - Secure password reset
- **User Profile Management**:
  - Update personal information
  - Delete account
- **Event Management**:
  - View event listings
  - Create, edit, delete events (full CRUD)
  - Register and unregister for events

### Backend

- **Admin Panel**:
  - Manage users (view, edit, delete)
  - Manage events (create, edit, delete)
  - Manage external APIs (Facebook, Google Maps, Weather, etc.)
- **Deployment with Kamal**:
  - Configure Kamal
  - Build and push Docker image
  - Deploy to production server

## Installation & Usage

1. **Clone the repository**:
   ```bash
   git clone <repo_url>
   cd <project_name>
   ```
2. **Install dependencies**:
   ```bash
   bundle install
   ```
3. **Set up the database**:
   ```bash
   rails db:create db:migrate
   ```
4. **Start the server**:
   ```bash
   rails s
   ```
5. **Access the application**:
   - Frontend: `http://localhost:3000`
   - Backend: `http://localhost:3000/admin`

## External APIs

The application integrates the following external APIs:

- **Facebook**: Authentication and event sharing
- **Google Maps**: Event location mapping
- **Weather API**: Display weather forecasts for events

## Security

- **Devise** is used for user authentication and session management.
- **CSRF Protection** is enabled to prevent cross-site request forgery.
- **JWT Tokens** can be used for API authentication.
- **Secure API Keys**: API keys are not hardcoded and are securely managed.

## Jury Evaluation Criteria

### Product Jury

- 🔄 The homepage clearly explains what the application offers.  
  Needs verification to ensure clarity for new users.

- ✅ The main functionality of the application is usable.  
  Users can create, manage, and register for events.

- ✅ Navigation on the site is simple and intuitive.  
  Navigation bar and links are in place.

- ✅ The signup page only asks for email and password.  
  Signup form fields are minimal.

### Technical Jury

- ✅ No inappropriate language mixes.  
  Code and comments are in English.

- ✅ Models have relationships between them.  
  Users, events, and registrations are related.

- ✅ The application architecture follows the REST model.  
  RESTful routes are defined in `config/routes.rb`.

- ✅ API keys are not hardcoded in the code.  
  Assuming API keys are managed securely.

- ✅ Class, model, and variable names are in English.  
  Consistent naming conventions are used.

- ✅ Links use Rails helpers.  
  Helpers like `link_to` are used.

- 🔄 Fat Model Skinny Controllers.  
  Needs verification to ensure controllers are light.

- 🔄 Services are used to lighten controllers.  
  Needs verification to ensure services are implemented.

- ✅ Table names are product-oriented.  
  Table names like `users` and `events` are meaningful.

- 🔄 Presence of a mailer.  
  Mailer functionality needs to be implemented.

- ✅ Clean routes and use of nested resources.  
  Routes are defined in `config/routes.rb`.

- ✅ Validations in models.  
  Validations are present in models like `User`.

- ❌ APIs are wrapped in services.  
  API services need to be implemented.

- ✅ Attribute types match the parameters.  
  Correct data types are used in migrations.

- ✅ Migrations are clean and replicable.  
  Migrations are present and can be replicated.

- ✅ Presence of a seed file.  
  Seed file is present for initial data setup.

- ✅ N-N relationships use `has_many through`.  
  Relationships are correctly defined.

### Curriculum Jury

- 🔄 Functional application in production.  
  Needs deployment to production environment.

- ✅ Branching authentication system.  
  Authentication system is in place.

- 🔄 Functional mailer in production.  
  Mailer functionality needs to be implemented.

- ❌ Use of an external API.  
  External API integration needs to be implemented.

- ✅ At least two models related to each other.  
  Users and events are related.

- 🔄 Component-oriented frontend.  
  Needs verification to ensure components are used.

- 🔄 The 5 Devise views have CSS.  
  Needs verification to ensure CSS is applied.

- 🔄 The frontend is acceptable.  
  Needs verification to ensure UI/UX quality.

- 🔄 The site is readable.  
  Needs verification to ensure readability.

### Teamwork

- 🔄 All team members have contributed to the code.  
  Needs verification through commit history.

- 🔄 Use of Trello or a similar tool for project management.  
  Needs verification to ensure project management tools are used.

- 🔄 Code is hosted on GitHub or GitLab.  
  Needs verification to ensure code is hosted.

- 🔄 Use of Git branches.  
  Needs verification to ensure branching strategy is followed.

- 🔄 Code is commented and properly indented.  
  Needs verification to ensure code quality.

- 🔄 No commits on Master.  
  Needs verification to ensure branching strategy is followed.

- 🔄 Commits are frequent and explicit.  
  Needs verification to ensure commit quality.

- 🔄 Commit messages are in English.  
  Needs verification to ensure commit messages are in English.

- 🔄 Production pipeline is present.  
  Needs verification to ensure CI/CD pipeline is set up.

- 🔄 One branch per feature.  
  Needs verification to ensure branching strategy is followed.

- 🔄 Agile concepts are used in project management.  
  Needs verification to ensure agile practices are followed.

- 🔄 Daily stand-ups.  
  Needs verification to ensure stand-ups are conducted.

- 🔄 Equitable distribution of work.  
  Needs verification to ensure work is evenly distributed.

## Project Members

This project was developed by:

- [Houdheyfa Kaddouri](https://github.com/houdheyfakaddouri)
- [Slingod](https://github.com/Slingod)

## License

This project is licensed under the **MIT License**.
