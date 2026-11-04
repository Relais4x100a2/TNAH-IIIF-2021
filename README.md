# TNAH IIIF — Battle of Bapaume (1871)

## Academic context

This project was completed as part of the **English course** in the second year of the **Master’s programme in Digital Humanities** (*Technologies du Numérique Appliquées à l’Histoire* — **M2 TNAH**) at the **École nationale des chartes** (Paris). It combines language work with practical use of the **IIIF** (International Image Interoperability Framework) ecosystem for publishing and annotating a historical image.

## Description

A minimal **IIIF Presentation API 2.x** setup that displays a lithograph of the **Battle of Bapaume** (Franco-Prussian War, 3 January 1871) in **[Mirador](https://projectmirador.org/)**, with curated **annotations** (comments and tags) on regions of the image. The main image is served from an external IIIF endpoint; annotation text and embedded illustrations are kept **local** under `img/` so the site can be deployed without depending on third-party image hosts for those assets.

## Repository contents

| Item | Role |
|------|------|
| `index.html` | Single-page viewer: Mirador (via unpkg), French UI, custom styling for annotation overlays and sidebar. |
| `manifest_GC.json` | IIIF manifest pointing to the canvas and painting annotation, plus a link to the commentary annotation list. |
| `annotations_GC.json` | Annotation list (Open Annotation / Shared Canvas style) used by Mirador for sidebar and on-canvas highlights. |
| `img/` | Local images referenced from annotation HTML (e.g. portraits, uniform details). |
| `Dockerfile` | Builds the production image: static files served by unprivileged nginx on port 8080. |
| `.dockerignore` | Keeps the repository's non-site files out of the image. |

## Requirements

- A **local HTTP server** (or any static hosting). Opening `index.html` as `file://` will block fetches for JSON and images in most browsers.

Example:

```bash
python3 -m http.server 8080
```

Then open `http://localhost:8080/`.

## Deployment

The project is static and is deployed with **Coolify** (public Git repository, Dockerfile build pack, port 8080) at `https://tnah-iiif.toldot.fr`. The `Dockerfile` serves the files with unprivileged nginx (uid 101) and rewrites `http://` links to `https://` in the JSON files to avoid mixed content. Mirador is pinned to 3.4.3 in `index.html`.

To test the image locally:

```bash
docker build -t tnah-iiif . && docker run --rm -p 8080:8080 tnah-iiif
```

If you host the site elsewhere, make sure the `@id` values in `manifest_GC.json` and `annotations_GC.json` match your own URL.

## Licence

Object rights and reuse conditions are stated in the manifest (`license` / attribution fields). Respect those terms when reusing the material.

## Author

Coursework — M2 TNAH, English class, École nationale des chartes.
