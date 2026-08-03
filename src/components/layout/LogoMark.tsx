/** Vector re-draw of the brand mark for small sizes (header, favicon-scale
 * contexts). The source AI-generated artwork (public/logo-icon.png) has
 * soft/glowing edges baked into the raster itself, so no amount of
 * next/image resizing makes it crisp at 36px — a hand-drawn SVG is. */
export function LogoMark({ className }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 40 40"
      className={className}
      aria-hidden="true"
      xmlns="http://www.w3.org/2000/svg"
    >
      <rect width="40" height="40" rx="10" fill="#00285C" />
      <path
        d="M11 28V12h3.9L20 19.6 25.1 12H29v16h-3.7V17.9l-4.2 6.1h-2.2l-4.2-6.1V28H11Z"
        fill="#FFFFFF"
      />
      <circle cx="31.5" cy="9.5" r="3" fill="#00A8A8" />
    </svg>
  );
}
