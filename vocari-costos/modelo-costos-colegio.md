# Vocari.cl - Modelo de Costos por Colegio

## Costos Fijos (Mensuales)

| Concepto | Costo | Notas |
|----------|-------|-------|
| Google Workspace Business Starter (3 cuentas) | **$36 USD/mes** | $12 USD × 3 usuarios |
| ChatGPT Team (1 cuenta) | $30 USD/mes | Incluidos: Whisper (transcripción), GPT-4o |
| Supabase Pro | $25 USD/mes | 100 GB storage, 100 GB bandwidth |
| **Total Fijo** | **$91 USD/mes** | |

---

## Supabase - Costo por Almacenamiento

**Supabase Pro:** $25 USD/mes incluye:
- 100 GB storage
- 100 GB bandwidth

**Estimación de almacenamiento por alumno:**
- Datos perfil RIASEC: ~10 KB/año
- Resultados test: ~5 KB/año
- **Sesiones orientación: 120 × ~3MB = ~360 MB/año**
- Historial académico: ~1 MB/año

**Total: ~365 MB/alumno/año (~30 MB/alumno/mes)**

---

## Capacidad Supabase Pro

| Alumnos | Storage Usado | % de 100GB |
|---------|--------------|-------------|
| 100 | 35 GB | 35% |
| 500 | 175 GB | 175% |
| 1,000 | 365 GB | 365% |

**Para >270 alumnos se necesita Supabase Team ($599 USD/mes) o Enterprise**

---

## Cálculo de Costos

### Por 10 Alumnos

| Concepto | Cantidad | Costo |
|----------|----------|-------|
| Google Workspace | 3 usuarios | $36 |
| ChatGPT Team | 1 usuario | $30 |
| Supabase Pro | 100 GB (incluido) | $25 |
| Storage (10 × 365 MB) | 3.6 GB | - |
| **Total** | | **$91 USD/mes** |

### Por 30 Alumnos

| Concepto | Cantidad | Costo |
|----------|----------|-------|
| Google Workspace | 3 usuarios | $36 |
| ChatGPT Team | 1 usuario | $30 |
| Supabase Pro | 100 GB (incluido) | $25 |
| Storage (30 × 365 MB) | 11 GB | - |
| **Total** | | **$91 USD/mes** |

### Por 50 Alumnos

| Concepto | Cantidad | Costo |
|----------|----------|-------|
| Google Workspace | 3 usuarios | $36 |
| ChatGPT Team | 1 usuario | $30 |
| Supabase Pro | 100 GB (incluido) | $25 |
| Storage (50 × 365 MB) | 18 GB | - |
| **Total** | | **$91 USD/mes** |

### Por 100 Alumnos

| Concepto | Cantidad | Costo |
|----------|----------|-------|
| Google Workspace | 3 usuarios | $36 |
| ChatGPT Team | 1 usuario | $30 |
| Supabase Pro | 100 GB (incluido) | $25 |
| Storage (100 × 365 MB) | 35 GB | - |
| **Total** | | **$91 USD/mes** |

### Por 200 Alumnos

| Concepto | Cantidad | Costo |
|----------|----------|-------|
| Google Workspace | 3 usuarios | $36 |
| ChatGPT Team | 1 usuario | $30 |
| Supabase Pro | 100 GB (incluido) | $25 |
| Storage (200 × 365 MB) | 73 GB | - |
| **Total** | | **$91 USD/mes** |

### Por 500 Alumnos

| Concepto | Cantidad | Costo |
|----------|----------|-------|
| Google Workspace | 3 usuarios | $36 |
| ChatGPT Team | 1 usuario | $30 |
| **Supabase Team** | 500 GB | $599 |
| Storage (500 × 365 MB) | 182 GB | - |
| **Total** | | **$665 USD/mes** |

---

## Resumen: Costo Total por Colegio

| Alumnos | Fijo (Google+ChatGPT) | Supabase | **Total Mensual** |
|---------|----------------------|----------|-------------------|
| 10 | $66 | $25 | **$91 USD** |
| 30 | $66 | $25 | **$91 USD** |
| 50 | $66 | $25 | **$91 USD** |
| 100 | $66 | $25 | **$91 USD** |
| 200 | $66 | $25 | **$91 USD** |
| 500 | $66 | $599 | **$665 USD** |

---

## Múltiples Colegios

| Colegios | Alumnos c/u | Total Alumnos | Costo Mensual |
|----------|-------------|---------------|---------------|
| 1 | 100 | 100 | $91 USD |
| 5 | 100 | 500 | $455 USD |
| 10 | 100 | 1,000 | $910 USD |
| 5 | 200 | 1,000 | $455 USD |
| 10 | 200 | 2,000 | $910 USD |

---

## Notas

1. **Transcripción**: ChatGPT Team incluye Whisper (~120 sesiones × $0.01 = $1.2 USD/mes)
2. **Google Workspace**: 3 cuentas @ $12 USD cada una
3. **Supabase Team** ($599 USD) se necesita cuando pasas de ~270 alumnos totales
4. **Break-even**: Con pricing de $5-10 USD/alumno/mes → ~10-20 alumnos

---

## Costos Orientadores (Referencia)

| Ratio | Costo |
|-------|-------|
| 1 orientador / 30 alumnos | Asumido como personal existente del colegio |
| Sesión individual (30 min) | $5,000 CLP (~ $5 USD) |
| Sesión grupal (1 hora, 10 alumnos) | $15,000 CLP (~ $15 USD) |

---

*Actualizado: 2026-03-07*
