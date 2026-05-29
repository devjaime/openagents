import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Jaime Hernández | AI & Software Engineer",
  description: "AI & Software Engineering | Founder of CodeIA | Cloud, Backend & Automation",
  keywords: ["AI", "Software Engineer", "Backend", "Go", "Python", "LangChain", "Chile"],
  authors: [{ name: "Jaime Hernández" }],
  openGraph: {
    title: "Jaime Hernández | AI & Software Engineer",
    description: "AI & Software Engineering | Founder of CodeIA | Cloud, Backend & Automation",
    url: "https://jaimehernandez.dev",
    siteName: "Jaime Hernández",
    locale: "es_CL",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es">
      <body className="antialiased">
        {children}
      </body>
    </html>
  );
}
