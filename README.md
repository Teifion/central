# Central
A phoenix application containing basic user and admin functionality designed to be used as a foundation for other applications.

### Features
#### User
- User signup, profile, password reset
- Group membership with invite system
- User configs
- Recently used

#### Admin
- User administration
- Group administration
- Usage logs
- Error logs
- Audit/Admin logs
- Site runtime config

#### Dev
- Granular permission system

#### Other
- Blog

### Setup instructions
#### Files
Add other app and app_web folders to [/lib](/lib) and [/test](/test) as needed. This repo includes an "example" extension with the bare minimum required 

#### Config
[config/config.exs](config/config.exs) `config :central, Extensions` has keys for adding references to the extended applications.
- `applications`: Each entry must be a module with a function `children/0` returning a list of children to be started as per the typical application supervisor.
- `startups`: Each entry must be a module with a function `startup/0` which will be executed during the startup process. The application supervisor will have been started at this stage so things like the database will be accessible.
- `index_views`: A list of views to be used on the `auth_index.html.eex` page, Each will call to render `index.eex` for the given view. Used to add icons to the homepage.
- `topmenu_views`: A list of views to be used on the `auth_index.html.eex` page, Each will call to render `index.eex` for the given view. Used to add icons to the side menu on admin views.
- routers (still have to be done semi manually), see `lib/central_web/router.ex` for an example of how

### Todo
- rate_limiter_plug.ex (version I copied from previous project uses ExRated which I might not need now)
- Communication chat rooms
- Group configs (maybe)
- Support for unauthed main site, maybe with some crude CMS
- Site search (and relevant hooks/callbacks)
- Friend system
- Temporary accounts (send a link to a friend for something)
- Something to indicate on user registration the email doesn't need to be valid
- Privacy policy page
