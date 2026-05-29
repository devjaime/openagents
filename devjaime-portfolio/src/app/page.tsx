const projects = [
  {
    name: "Vocari.cl",
    description: "Guía vocacional con IA basada en el método RIASEC y datos reales del MINEDUC. Test vocacional + informes profesionales.",
    tech: ["Next.js", "TypeScript", "AI/LangChain", "PostgreSQL"],
    url: "https://vocari.cl",
    status: "🟢 Activo",
    statusClass: "status-active",
  },
  {
    name: "HumanLoop.cl",
    description: "Plataforma HITL (Human-in-the-Loop) que conecta agentes AI con operadores humanos para tareas del mundo real.",
    tech: ["Next.js", "MCP", "WebSocket", "PWA"],
    url: "https://humanloop.cl",
    status: "🟢 Activo",
    statusClass: "status-active",
  },
  {
    name: "FlipReady",
    description: "Plataforma de operaciones tipo Airbnb para gestión de propiedades, automatización de limpieza y check-ins.",
    tech: ["Go", "React", "PostgreSQL", "Automation"],
    url: "#",
    status: "🔵 En desarrollo",
    statusClass: "status-dev",
  },
  {
    name: "HealthAI",
    description: "App de entrenamiento con IA + Apple HealthKit. Planes personalizados y seguimiento de métricas de salud.",
    tech: ["React Native", "Python", "AI", "HealthKit"],
    url: "#",
    status: "🔵 En desarrollo",
    statusClass: "status-dev",
  },
];

const skills = [
  { name: "Backend", items: ["Go", "Python", "Node.js", "PostgreSQL", "Oracle"] },
  { name: "AI/LLM", items: ["LangChain", "LangGraph", "CrewAI", "Claude API", "Ollama"] },
  { name: "Cloud", items: ["GCP", "Cloud Run", "BigQuery", "Docker"] },
  { name: "Frontend", items: ["Next.js", "React", "TypeScript", "Tailwind"] },
];

const services = [
  {
    title: "Desarrollo Backend",
    description: "APIs robustas, microservicios, procesamiento de datos, optimización de bases de datos.",
    icon: "⚙️",
  },
  {
    title: "Integraciones AI",
    description: "Agentes, RAG pipelines, workflows automatizados con LangChain y MCP.",
    icon: "🤖",
  },
  {
    title: "Consultoría Técnica",
    description: "Arquitectura de software, revisión de código, optimización de rendimiento.",
    icon: "📊",
  },
  {
    title: "Automatización",
    description: "Scripts, bots, integración de APIs, flujos de trabajo automatizados.",
    icon: "⚡",
  },
];

const testimonials = [
  {
    name: "Vocari.cl",
    role: "Producto propio",
    text: "Guía vocacional con +1000 estudiantes atendidos",
    icon: "🎯",
  },
  {
    name: "Retail Chile",
    role: "Sistema de inventario",
    text: "50M+ SKUs, 5 países, optimización de queries",
    icon: "🏪",
  },
];

export default function Home() {
  return (
    <main className="min-h-screen gradient-bg">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 glass border-b border-white/5">
        <div className="max-w-6xl mx-auto px-6 py-4 flex justify-between items-center">
          <a href="#" className="text-2xl font-bold gradient-text">JH</a>
          <div className="hidden md:flex gap-8 items-center">
            <a href="#about" className="text-slate-300 hover:text-white transition text-sm font-medium">Historia</a>
            <a href="#projects" className="text-slate-300 hover:text-white transition text-sm font-medium">Proyectos</a>
            <a href="#services" className="text-slate-300 hover:text-white transition text-sm font-medium">Servicios</a>
            <a href="#contact" className="px-4 py-2 bg-white/10 hover:bg-white/20 rounded-full text-sm font-medium transition">Contacto</a>
          </div>
        </div>
      </nav>

      {/* Hero */}
      <section className="min-h-screen flex items-center justify-center relative overflow-hidden">
        <div className="absolute inset-0 hero-gradient"></div>
        
        {/* Floating shapes */}
        <div className="floating-shape w-96 h-96 bg-sky-500/20 -top-20 -left-20 float"></div>
        <div className="floating-shape w-80 h-80 bg-violet-500/20 top-1/3 right-10 float" style={{animationDelay: '1s'}}></div>
        <div className="floating-shape w-64 h-64 bg-pink-500/15 bottom-20 left-1/4 float" style={{animationDelay: '2s'}}></div>
        
        <div className="relative z-10 text-center px-4 max-w-4xl mx-auto">
          <div className="mb-6 inline-block px-4 py-1 rounded-full glass text-sm text-sky-400 animate-in">
            🚀 Disponible para proyectos
          </div>
          
          <p className="text-sky-400 font-medium mb-4 animate-in stagger-1">👋 Hola, soy</p>
          <h1 className="text-6xl md:text-8xl font-bold mb-6 animate-in stagger-2">
            <span className="gradient-text">Jaime Hernández</span>
          </h1>
          <h2 className="text-2xl md:text-4xl text-slate-200 mb-8 font-light animate-in stagger-3">
            AI & <span className="gradient-text font-semibold">Software Engineer</span>
          </h2>
          <p className="text-lg text-slate-400 max-w-2xl mx-auto mb-10 leading-relaxed animate-in stagger-4">
            Construyo soluciones inteligentes con <strong className="text-white">Go, Python y AI</strong>. 
            Founder de <a href="https://vocari.cl" className="text-sky-400 hover:underline">Vocari.cl</a> y 
            <a href="https://humanloop.cl" className="text-violet-400 hover:underline"> HumanLoop.cl</a>
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center animate-in" style={{animationDelay: '0.5s'}}>
            <a href="#projects" className="btn-primary">
              Ver Proyectos →
            </a>
            <a href="#contact" className="btn-secondary">
              Contactar
            </a>
          </div>
          
          {/* Social links */}
          <div className="flex justify-center gap-6 mt-12">
            <a href="https://github.com/devjaime" target="_blank" rel="noopener" 
               className="w-12 h-12 flex items-center justify-center rounded-full glass hover:glow-primary transition text-lg">
              🐙
            </a>
            <a href="https://linkedin.com/in/devjaime" target="_blank" rel="noopener"
               className="w-12 h-12 flex items-center justify-center rounded-full glass hover:glow-primary transition text-lg">
              💼
            </a>
            <a href="mailto:hernandez.hs@gmail.com"
               className="w-12 h-12 flex items-center justify-center rounded-full glass hover:glow-primary transition text-lg">
              📧
            </a>
          </div>
        </div>

        {/* Scroll indicator */}
        <div className="absolute bottom-8 left-1/2 -translate-x-1/2 float">
          <div className="w-6 h-10 rounded-full border-2 border-slate-600 flex items-start justify-center p-1">
            <div className="w-1 h-2 bg-sky-400 rounded-full animate-pulse"></div>
          </div>
        </div>
      </section>

      {/* About */}
      <section id="about" className="section">
        <h2 className="text-4xl font-bold mb-12 text-center">
          <span className="gradient-text">Historia</span>
        </h2>
        <div className="grid md:grid-cols-2 gap-12 items-start">
          <div>
            <p className="text-lg text-slate-200 mb-6 leading-relaxed">
              Soy <strong className="text-white">Ingeniero de Software</strong> de Santiago, Chile, con más de 8 años de experiencia 
              construyendo sistemas backend robustos y soluciones de IA.
            </p>
            <p className="text-slate-400 mb-6 leading-relaxed">
              Mi enfoque está en crear productos que <strong className="text-sky-400">generen valor real</strong>: desde sistemas de 
              inventario para retail (50M+ SKUs) hasta plataformas de orientación vocacional con AI.
            </p>
            <p className="text-slate-400 mb-8 leading-relaxed">
              Trabajo con empresas medianas y startups para transformar ideas en productos funcionales. 
              Priorizo <strong className="text-violet-400">progreso sobre perfección</strong> y soluciones prácticas sobre documentación extensa.
            </p>
            
            <div className="flex flex-wrap gap-3">
              {["Go", "Python", "TypeScript", "PostgreSQL", "AI/LLM", "GCP", "LangChain"].map(skill => (
                <span key={skill} className="badge">{skill}</span>
              ))}
            </div>
          </div>
          
          {/* Skills cards */}
          <div className="grid grid-cols-2 gap-4">
            {skills.map(cat => (
              <div key={cat.name} className="card p-5 rounded-2xl">
                <h3 className="font-semibold text-sky-400 mb-3">{cat.name}</h3>
                <div className="flex flex-wrap gap-2">
                  {cat.items.map(item => (
                    <span key={item} className="text-xs text-slate-400 bg-white/5 px-2 py-1 rounded">{item}</span>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Projects */}
      <section id="projects" className="section bg-slate-900/30">
        <h2 className="text-4xl font-bold mb-4 text-center">
          <span className="gradient-text">Proyectos</span>
        </h2>
        <p className="text-slate-400 text-center mb-12 max-w-2xl mx-auto">
          Productos propios que construyo con enfoque en impacto real y monetización
        </p>
        
        <div className="grid md:grid-cols-2 gap-6">
          {projects.map(project => (
            <a 
              key={project.name}
              href={project.url}
              target="_blank"
              rel="noopener"
              className="card project-card p-8 rounded-2xl block group"
            >
              <div className="flex justify-between items-start mb-4">
                <div>
                  <h3 className="text-2xl font-bold text-white group-hover:gradient-text transition">
                    {project.name}
                  </h3>
                </div>
                <span className={`text-sm px-3 py-1 rounded-full ${project.statusClass}`}>
                  {project.status}
                </span>
              </div>
              <p className="text-slate-400 mb-6 leading-relaxed">{project.description}</p>
              <div className="flex flex-wrap gap-2">
                {project.tech.map(t => (
                  <span key={t} className="text-xs bg-white/10 text-slate-300 px-3 py-1 rounded-full">{t}</span>
                ))}
              </div>
            </a>
          ))}
        </div>
      </section>

      {/* Services */}
      <section id="services" className="section">
        <h2 className="text-4xl font-bold mb-12 text-center">
          <span className="gradient-text">Servicios</span>
        </h2>
        
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
          {services.map((service, idx) => (
            <div key={service.title} className="service-card card p-8 rounded-2xl text-center hover:border-violet-500/50">
              <div className="service-icon">{service.icon}</div>
              <h3 className="text-lg font-semibold mb-2">{service.title}</h3>
              <p className="text-sm text-slate-400">{service.description}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Stats */}
      <section className="py-16 relative overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-r from-sky-500/10 to-violet-500/10"></div>
        <div className="max-w-4xl mx-auto px-4 relative z-10">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            <div>
              <div className="text-4xl font-bold gradient-text mb-2">8+</div>
              <div className="text-slate-400 text-sm">Años experiencia</div>
            </div>
            <div>
              <div className="text-4xl font-bold gradient-text mb-2">2</div>
              <div className="text-slate-400 text-sm">Productos propios</div>
            </div>
            <div>
              <div className="text-4xl font-bold gradient-text mb-2">50M+</div>
              <div className="text-slate-400 text-sm">SKUs gestionados</div>
            </div>
            <div>
              <div className="text-4xl font-bold gradient-text mb-2">1000+</div>
              <div className="text-slate-400 text-sm">Estudiantes</div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-20 text-center relative overflow-hidden">
        <div className="absolute inset-0 hero-gradient"></div>
        <div className="relative z-10 max-w-2xl mx-auto px-4">
          <h2 className="text-4xl font-bold mb-4">¿Tienes una idea?</h2>
          <p className="text-slate-400 mb-8">Hablemos sobre cómo convertirla en producto</p>
          <a href="mailto:hernandez.hs@gmail.com" className="btn-primary inline-block">
            Escríbeme →
          </a>
        </div>
      </section>

      {/* Contact */}
      <section id="contact" className="section pb-20">
        <h2 className="text-4xl font-bold mb-12 text-center">
          <span className="gradient-text">Contacto</span>
        </h2>
        
        <div className="max-w-xl mx-auto text-center">
          <p className="text-slate-400 mb-10">
            ¿Interesado en trabajar juntos? ¿Tienes un proyecto en mente?
            Estoy disponible para consultas técnicas y proyectos de desarrollo.
          </p>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-8">
            <a 
              href="mailto:hernandez.hs@gmail.com" 
              className="btn-primary"
            >
              📧 hernandez.hs@gmail.com
            </a>
            <a 
              href="https://linkedin.com/in/devjaime" 
              target="_blank"
              rel="noopener"
              className="btn-secondary"
            >
              💼 LinkedIn
            </a>
          </div>
          
          <p className="text-sm text-slate-500 mt-12">
            © 2026 Jaime Hernández. Construido con Next.js + Tailwind
          </p>
        </div>
      </section>
    </main>
  );
}
