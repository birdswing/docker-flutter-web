# Docker Hub
https://hub.docker.com/r/birdswing/flutter-web

# How to use this image

Build Flutter Web Applications with your own `Dockerfile`, that might look like this:

```Dockerfile
FROM birdswing/flutter-web:latest AS build

COPY pubspec.yaml .
COPY pubspec.lock .
RUN flutter pub get
RUN flutter clean 

COPY . .

# Uncomment this line to auto-generate files for localization, JSON serialization, etc:
# RUN dart run build_runner build --delete-conflicting-outputs

# Debug Build: 
#RUN flutter build web --verbose --profile --dart2js-optimization=O0 --source-maps
# Release build: 
RUN flutter build web --verbose

FROM nginx:alpine

COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Keep your build image clean by adding creating a `.dockerignore` file:
```gitignore
*

!/lib/
!/web/

!.metadata
!l10n.yaml
!pubspec.lock
!pubspec.yaml
```
