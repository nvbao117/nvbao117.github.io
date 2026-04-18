---
layout: page
icon: fas fa-code-branch
order: 1
title: Projects
---

<style>
.project-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 1.2rem;
  margin-top: 1.2rem;
}
.project-card {
  border: 1px solid var(--card-border-color, #e5e7eb);
  border-radius: 12px;
  padding: 1.1rem 1.2rem;
  background: var(--card-bg, transparent);
  transition: transform .15s ease, box-shadow .15s ease;
  display: flex;
  flex-direction: column;
}
.project-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 18px rgba(0,0,0,.08);
}
.project-card h3 { margin: 0 0 .4rem 0; font-size: 1.1rem; }
.project-card h3 a { text-decoration: none; }
.project-card .summary { color: var(--text-muted-color); font-size: .9rem; flex: 1; }
.project-card .tech {
  margin-top: .8rem;
  display: flex;
  flex-wrap: wrap;
  gap: .3rem;
}
.project-card .tech span {
  font-size: .72rem;
  padding: .15rem .5rem;
  border-radius: 999px;
  background: var(--btn-border-color, #f0f0f0);
  color: var(--text-color);
}
.project-card .links { margin-top: .8rem; font-size: .85rem; }
.project-card .links a { margin-right: .8rem; }
</style>

Danh sách các dự án mình đã và đang làm. Click vào từng project để xem chi tiết.

<div class="project-grid">
{% assign projects = site.projects | sort: 'order' %}
{% for p in projects %}
  <div class="project-card">
    <h3><a href="{{ p.url | relative_url }}">{{ p.title }}</a></h3>
    <div class="summary">{{ p.summary | default: p.excerpt | strip_html | truncate: 160 }}</div>
    {% if p.tech %}
    <div class="tech">
      {% for t in p.tech %}<span>{{ t }}</span>{% endfor %}
    </div>
    {% endif %}
    <div class="links">
      {% if p.repo %}<a href="{{ p.repo }}" target="_blank"><i class="fab fa-github"></i> Code</a>{% endif %}
      {% if p.demo %}<a href="{{ p.demo }}" target="_blank"><i class="fas fa-external-link-alt"></i> Demo</a>{% endif %}
    </div>
  </div>
{% endfor %}
</div>
