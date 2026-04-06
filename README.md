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
| `captain-definition` | Optional configuration if you deploy with [CapRover](https://caprover.com/). |

## Requirements

- A **local HTTP server** (or any static hosting). Opening `index.html` as `file://` will block fetches for JSON and images in most browsers.

Example:

```bash
python3 -m http.server 8080
```

Then open `http://localhost:8080/`.

## Deployment

The project is static: upload the files to **GitHub Pages**, **Netlify**, or any web host. Ensure `manifest_GC.json` uses URLs that match your deployment (e.g. relative `./annotations_GC.json` for annotations on the same origin).

## Licence

Object rights and reuse conditions are stated in the manifest (`license` / attribution fields). Respect those terms when reusing the material.

## Author

Coursework — M2 TNAH, English class, École nationale des chartes.
