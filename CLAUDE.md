# CLAUDE.md - Project Guide

## Overview

Personal portfolio website for Anisha Yerramilli, a UX Designer & Creative. Built with Jekyll for GitHub Pages hosting at `anisha-yerramilli.github.io`.

## Tech Stack

- **Jekyll** - Static site generator (GitHub Pages compatible)
- **SCSS** - Styling with design tokens
- **Vanilla JS** - Mobile menu, lightbox, smooth scroll
- **kramdown** - Markdown processor
- **Plugins**: jekyll-seo-tag, jekyll-sitemap

## Development Commands

```bash
# Install dependencies
bundle install

# Run local server (http://localhost:4000)
bundle exec jekyll serve

# Build for production
bundle exec jekyll build
```

## Directory Structure

```
├── _config.yml          # Site configuration
├── _data/               # YAML data files
│   ├── navigation.yml   # Nav menu items
│   ├── projects.yml     # Project metadata
│   ├── experience.yml   # Work timeline
│   └── wix_assets.yml   # Asset mappings
├── _includes/           # Reusable components
│   ├── head.html        # Meta, fonts, CSS
│   ├── header.html      # Navigation
│   ├── footer.html      # Footer + social links
│   ├── project-card.html
│   └── photo-grid.html
├── _layouts/            # Page templates
│   ├── default.html     # Base layout
│   ├── page.html        # Standard pages
│   └── project.html     # Project detail pages
├── assets/
│   ├── css/main.scss    # All styles (~970 lines)
│   ├── js/main.js       # JS functionality
│   ├── images/wix/      # Project images
│   └── videos/          # Video assets
├── projects/            # Project markdown files
└── scripts/             # Utility scripts
```

## Key Files

| File | Purpose |
|------|---------|
| `_config.yml` | Site title, author, collections, plugins |
| `_data/projects.yml` | Project cards on /projects page |
| `_data/navigation.yml` | Header navigation links |
| `assets/css/main.scss` | All CSS with design tokens |
| `index.html` | Homepage with hero section |

## Design System

### Colors (Warm Earth Tones)
- Primary: `#C4A484` (tan)
- Secondary: `#8B7355` (brown)
- Accent: `#D4A574` (lighter tan)
- Background: `#FAF8F5` (off-white)
- Text: `#2C2C2C` (dark gray)

### Typography
- Headings: Playfair Display (serif)
- Body: Inter (sans-serif)

### Spacing Scale
- xs: 0.5rem, sm: 1rem, md: 1.5rem, lg: 2rem, xl: 3rem, 2xl: 4rem, 3xl: 6rem

## Content Patterns

### Adding a New Project

1. Create `/projects/project-name.md`:
```yaml
---
layout: project
title: "Project Title"
year: 2024
hero_image: /assets/images/wix/image.jpg
tags: [UX Design, Mobile]
---
Content here...
```

2. Add entry to `_data/projects.yml`:
```yaml
- name: project-name
  title: "Project Title"
  description: "Short description"
  image: /assets/images/wix/thumb.jpg
  tags: [UX Design]
  year: 2024
  featured: true
```

### Adding Navigation Items

Edit `_data/navigation.yml`:
```yaml
- title: Page Name
  url: /page-name
```

### Project Image Grids

Use CSS classes in project markdown:
```html
<div class="project-gallery grid-2">  <!-- 2 columns -->
<div class="project-gallery grid-3">  <!-- 3 columns -->
```

## Pages

| Page | File | Description |
|------|------|-------------|
| Home | `index.html` | Hero + intro |
| About | `about.md` | Bio, skills, education |
| Projects | `projects.html` | Project grid |
| Creative | `creative.html` | Art gallery |
| Photography | `photography.html` | Photo gallery |
| Experience | `experience.md` | Work timeline |
| Contact | `contact.md` | LinkedIn link |

## Conventions

- Images go in `/assets/images/wix/`
- Videos go in `/assets/videos/`
- Project permalinks: `/projects/:name/`
- Use existing CSS classes; avoid inline styles
- Mobile breakpoint: 768px
- Lazy loading on gallery images: `loading="lazy"`

## Deployment

Push to `main` branch - GitHub Pages auto-deploys.
