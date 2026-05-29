"use client";

import { useState, useEffect, useRef } from "react";

type Language = "en" | "es";

const content = {
  en: {
    title: "AI & Software Engineer",
    subtitle: "Building Intelligent Solutions",
    hero: "Hi, I'm Jaime Hernández",
    heroDesc: "I build AI-powered solutions and scalable systems. From 50M+ SKU inventory systems to vocational guidance platforms with AI.",
    projects: "Projects",
    skills: "Skills",
    contact: "Contact Me",
    letsTalk: "Let's Talk",
    available: "Available for projects",
    languages: "Languages",
    backend: "Backend",
    ai: "AI/LLM",
    cloud: "Cloud",
    frontend: "Frontend",
    email: "Email",
    linkedin: "LinkedIn",
    github: "GitHub",
    chatPlaceholder: "Ask me about my work...",
    chatGreeting: "Hi! I'm Jaime's AI assistant. Ask me about his projects, skills, or how he can help you.",
    thinking: "Thinking...",
    cta: "Ready to build something amazing?",
    cta2: "Let's create something together.",
    viewWork: "View My Work",
    meetJaime: "Meet Jaime",
  },
  es: {
    title: "Ingeniero de Software & AI",
    subtitle: "Construyendo Soluciones Inteligentes",
    hero: "Hola, soy Jaime Hernández",
    heroDesc: "Construyo soluciones con IA y sistemas escalables. Desde sistemas de inventario con 50M+ SKUs hasta plataformas de orientación vocacional con IA.",
    projects: "Proyectos",
    skills: "Habilidades",
    contact: "Contáctame",
    letsTalk: "Hablemos",
    available: "Disponible para proyectos",
    languages: "Idiomas",
    backend: "Backend",
    ai: "AI/LLM",
    cloud: "Nube",
    frontend: "Frontend",
    email: "Email",
    linkedin: "LinkedIn",
    github: "GitHub",
    chatPlaceholder: "Pregúntame sobre mi trabajo...",
    chatGreeting: "¡Hola! Soy el asistente de IA de Jaime. Pregúntame sobre sus proyectos, habilidades o cómo puede ayudarte.",
    thinking: "Pensando...",
    cta: "¿Listo para construir algo increíble?",
    cta2: "Creemos algo juntos.",
    viewWork: "Ver Mi Trabajo",
    meetJaime: "Conocer a Jaime",
  },
};

const projects = [
  {
    name: "Vocari.cl",
    desc: {
      en: "AI-powered vocational guidance platform with RIASEC method and MINEDUC data",
      es: "Plataforma de orientación vocacional con IA, método RIASEC y datos MINEDUC",
    },
    url: "https://vocari.cl",
    status: "Live",
  },
  {
    name: "HumanLoop.cl",
    desc: {
      en: "HITL orchestration platform connecting AI agents with human operators",
      es: "Plataforma HITL que conecta agentes IA con operadores humanos",
    },
    url: "https://humanloop.cl",
    status: "Live",
  },
];

const skills = {
  backend: ["Go", "Python", "Node.js", "PostgreSQL", "Oracle"],
  ai: ["LangChain", "LangGraph", "Claude API", "Ollama", "MCP"],
  cloud: ["GCP", "Cloud Run", "BigQuery", "Docker"],
  frontend: ["Next.js", "React", "TypeScript", "Tailwind"],
};

const aiResponses = {
  en: {
    skills: "Jaime specializes in Go, Python, PostgreSQL, LangChain, and building AI systems. He has 8+ years of experience in backend development and AI engineering.",
    projects: "His main projects are Vocari.cl (AI vocational guidance) and HumanLoop.cl (HITL platform). Both are live and operational!",
    contact: "You can contact him at hernandez.hs@gmail.com or through his LinkedIn. He's available for freelance projects and consulting.",
    default: "I'm his AI assistant! Ask me about his skills, projects, or how he can help your business. Type 'contact' for his email.",
  },
  es: {
    skills: "Jaime se especializa en Go, Python, PostgreSQL, LangChain y sistemas de IA. Tiene 8+ años de experiencia en desarrollo backend e ingeniería de IA.",
    projects: "Sus proyectos principales son Vocari.cl (orientación vocacional con IA) y HumanLoop.cl (plataforma HITL). ¡Ambos están vivos y operativos!",
    contact: "Puedes contactarlo en hernandez.hs@gmail.com o por LinkedIn. Está disponible para proyectos freelance y consultoría.",
    default: "¡Soy su asistente de IA! Pregúntame sobre sus habilidades, proyectos o cómo puede ayudar a tu negocio. Escribe 'contacto' para su email.",
  },
};

export default function Home() {
  const [lang, setLang] = useState<Language>("en");
  const [chatOpen, setChatOpen] = useState(false);
  const [messages, setMessages] = useState<{ role: string; content: string }[]>([]);
  const [input, setInput] = useState("");
  const [thinking, setThinking] = useState(false);
  const chatEndRef = useRef<HTMLDivElement>(null);

  const t = content[lang];

  useEffect(() => {
    if (chatOpen && messages.length === 0) {
      setMessages([{ role: "assistant", content: t.chatGreeting }]);
    }
  }, [chatOpen, lang, t.chatGreeting, messages.length]);

  useEffect(() => {
    chatEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const handleSend = () => {
    if (!input.trim()) return;
    
    const userMsg = { role: "user", content: input };
    setMessages((prev) => [...prev, userMsg]);
    setInput("");
    setThinking(true);

    // Simulate AI thinking
    setTimeout(() => {
      const lowerInput = input.toLowerCase();
      let response = aiResponses[lang].default;
      
      if (lowerInput.includes("skill") || lowerInput.includes("habilidad")) {
        response = aiResponses[lang].skills;
      } else if (lowerInput.includes("project") || lowerInput.includes("proyecto")) {
        response = aiResponses[lang].projects;
      } else if (lowerInput.includes("contact") || lowerInput.includes("correo") || lowerInput.includes("email")) {
        response = aiResponses[lang].contact;
      } else if (lowerInput.includes("hola") || lowerInput.includes("hi") || lowerInput.includes("hello")) {
        response = lang === "en" ? "Hello! I'm Jaime's AI assistant. How can I help you?" : "¡Hola! Soy el asistente de IA de Jaime. ¿Cómo puedo ayudarte?";
      }
      
      setMessages((prev) => [...prev, { role: "assistant", content: response }]);
      setThinking(false);
    }, 800 + Math.random() * 700);
  };

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === "Enter") handleSend();
  };

  return (
    <main className="min-h-screen bg-slate-950 text-white">
      {/* Header */}
      <header className="fixed top-0 left-0 right-0 z-50 bg-slate-950/80 backdrop-blur-lg border-b border-slate-800">
        <div className="max-w-6xl mx-auto px-4 py-3 flex justify-between items-center">
          <div className="flex items-center gap-4">
            <span className="text-xl font-bold bg-gradient-to-r from-emerald-400 to-cyan-400 bg-clip-text text-transparent">
              JH
            </span>
            <span className="text-xs px-2 py-1 bg-emerald-500/20 text-emerald-400 rounded-full">
              {t.available}
            </span>
          </div>
          <button
            onClick={() => setLang(lang === "en" ? "es" : "en")}
            className="px-3 py-1 text-sm bg-slate-800 hover:bg-slate-700 rounded-lg transition"
          >
            {lang === "en" ? "ES" : "EN"}
          </button>
        </div>
      </header>

      {/* Hero */}
      <section className="min-h-screen flex items-center justify-center relative overflow-hidden pt-20">
        <div className="absolute inset-0 bg-gradient-to-br from-slate-900 via-slate-950 to-slate-900" />
        <div className="absolute inset-0 opacity-30">
          <div className="absolute top-1/4 left-1/4 w-72 h-72 bg-emerald-500/20 rounded-full blur-3xl animate-pulse" />
          <div className="absolute bottom-1/4 right-1/4 w-72 h-72 bg-cyan-500/20 rounded-full blur-3xl animate-pulse" style={{ animationDelay: "1s" }} />
        </div>

        <div className="relative z-10 text-center px-4 max-w-4xl">
          <h1 className="text-5xl md:text-7xl font-bold mb-4">
            <span className="bg-gradient-to-r from-emerald-400 via-cyan-400 to-blue-500 bg-clip-text text-transparent">
              {t.hero}
            </span>
          </h1>
          <h2 className="text-xl md:text-2xl text-slate-300 mb-6">
            {t.title}
          </h2>
          <p className="text-lg text-slate-400 max-w-2xl mx-auto mb-8">
            {t.heroDesc}
          </p>

          <div className="flex flex-wrap gap-4 justify-center mb-12">
            <a
              href="#projects"
              className="px-6 py-3 bg-gradient-to-r from-emerald-500 to-cyan-500 rounded-full font-semibold hover:opacity-90 transition transform hover:scale-105"
            >
              {t.viewWork}
            </a>
            <a
              href="mailto:hernandez.hs@gmail.com"
              className="px-6 py-3 border border-slate-600 rounded-full font-semibold hover:border-emerald-500 transition"
            >
              {t.letsTalk}
            </a>
          </div>

          {/* Quick Stats */}
          <div className="grid grid-cols-3 gap-4 max-w-lg mx-auto">
            <div className="p-4 bg-slate-900/50 rounded-xl border border-slate-800">
              <div className="text-2xl font-bold text-emerald-400">8+</div>
              <div className="text-xs text-slate-400">{lang === "en" ? "Years" : "Años"}</div>
            </div>
            <div className="p-4 bg-slate-900/50 rounded-xl border border-slate-800">
              <div className="text-2xl font-bold text-cyan-400">2</div>
              <div className="text-xs text-slate-400">{t.projects}</div>
            </div>
            <div className="p-4 bg-slate-900/50 rounded-xl border border-slate-800">
              <div className="text-2xl font-bold text-blue-400">1K+</div>
              <div className="text-xs text-slate-400">{lang === "en" ? "Users" : "Usuarios"}</div>
            </div>
          </div>
        </div>
      </section>

      {/* Projects */}
      <section id="projects" className="py-20 px-4">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-3xl font-bold text-center mb-12">
            <span className="bg-gradient-to-r from-emerald-400 to-cyan-400 bg-clip-text text-transparent">
              {t.projects}
            </span>
          </h2>

          <div className="grid md:grid-cols-2 gap-6">
            {projects.map((project) => (
              <a
                key={project.name}
                href={project.url}
                target="_blank"
                rel="noopener"
                className="p-6 bg-slate-900/50 rounded-2xl border border-slate-800 hover:border-emerald-500/50 transition transform hover:-translate-y-1 group"
              >
                <div className="flex justify-between items-start mb-3">
                  <h3 className="text-xl font-bold group-hover:text-emerald-400 transition">
                    {project.name}
                  </h3>
                  <span className="px-2 py-1 text-xs bg-emerald-500/20 text-emerald-400 rounded">
                    {project.status}
                  </span>
                </div>
                <p className="text-slate-400 text-sm">
                  {project.desc[lang]}
                </p>
              </a>
            ))}
          </div>
        </div>
      </section>

      {/* Skills */}
      <section id="skills" className="py-20 px-4 bg-slate-900/30">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-3xl font-bold text-center mb-12">
            <span className="bg-gradient-to-r from-emerald-400 to-cyan-400 bg-clip-text text-transparent">
              {t.skills}
            </span>
          </h2>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {Object.entries(skills).map(([category, items]) => (
              <div key={category} className="p-4 bg-slate-900/50 rounded-xl border border-slate-800">
                <h3 className="text-sm font-semibold text-emerald-400 mb-3 capitalize">
                  {t[category as keyof typeof t] as string}
                </h3>
                <div className="flex flex-wrap gap-2">
                  {items.map((skill) => (
                    <span key={skill} className="text-xs text-slate-400">
                      {skill}
                    </span>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-20 px-4 text-center">
        <h2 className="text-2xl font-bold mb-4">{t.cta}</h2>
        <p className="text-slate-400 mb-8">{t.cta2}</p>
        <a
          href="mailto:hernandez.hs@gmail.com"
          className="inline-block px-8 py-4 bg-gradient-to-r from-emerald-500 to-cyan-500 rounded-full font-semibold hover:opacity-90 transition"
        >
          {t.contact}
        </a>
      </section>

      {/* Footer */}
      <footer className="py-8 px-4 border-t border-slate-800">
        <div className="max-w-4xl mx-auto flex flex-wrap justify-center gap-6">
          <a href="mailto:hernandez.hs@gmail.com" className="text-slate-400 hover:text-emerald-400 transition">
            📧 {t.email}
          </a>
          <a href="https://linkedin.com/in/devjaime" target="_blank" rel="noopener" className="text-slate-400 hover:text-emerald-400 transition">
            💼 {t.linkedin}
          </a>
          <a href="https://github.com/devjaime" target="_blank" rel="noopener" className="text-slate-400 hover:text-emerald-400 transition">
            🐙 {t.github}
          </a>
        </div>
        <p className="text-center text-slate-500 text-sm mt-6">
          © 2026 Jaime Hernández. {lang === "en" ? "Built with AI" : "Construido con IA"}.
        </p>
      </footer>

      {/* AI Chat Widget */}
      <div className="fixed bottom-6 right-6 z-50">
        {!chatOpen ? (
          <button
            onClick={() => setChatOpen(true)}
            className="w-14 h-14 bg-gradient-to-r from-emerald-500 to-cyan-500 rounded-full flex items-center justify-center text-2xl shadow-lg hover:scale-110 transition animate-bounce"
          >
            🤖
          </button>
        ) : (
          <div className="w-80 h-96 bg-slate-900 rounded-2xl border border-slate-700 shadow-2xl flex flex-col overflow-hidden">
            <div className="p-3 bg-gradient-to-r from-emerald-500 to-cyan-500 flex justify-between items-center">
              <span className="font-semibold text-sm">🤖 AI Assistant</span>
              <button onClick={() => setChatOpen(false)} className="text-white/80 hover:text-white">
                ✕
              </button>
            </div>
            <div className="flex-1 overflow-y-auto p-3 space-y-3">
              {messages.map((msg, i) => (
                <div
                  key={i}
                  className={`max-w-[85%] p-2 rounded-lg text-sm ${
                    msg.role === "user"
                      ? "ml-auto bg-emerald-500/20 text-emerald-400"
                      : "bg-slate-800 text-slate-300"
                  }`}
                >
                  {msg.content}
                </div>
              ))}
              {thinking && (
                <div className="bg-slate-800 text-slate-500 text-sm p-2 rounded-lg">
                  {t.thinking}
                </div>
              )}
              <div ref={chatEndRef} />
            </div>
            <div className="p-3 border-t border-slate-800 flex gap-2">
              <input
                type="text"
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyPress={handleKeyPress}
                placeholder={t.chatPlaceholder}
                className="flex-1 bg-slate-800 border border-slate-700 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-emerald-500"
              />
              <button
                onClick={handleSend}
                className="px-3 py-2 bg-emerald-500 rounded-lg text-sm hover:bg-emerald-600 transition"
              >
                ➤
              </button>
            </div>
          </div>
        )}
      </div>
    </main>
  );
}
