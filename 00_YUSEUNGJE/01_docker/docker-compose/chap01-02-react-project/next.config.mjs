/** @type {import('next').NextConfig} */
const nextConfig = {
  async rewrites() {
    return [
      {
        source: "/boot/:path*",
        // destination: "http://localhost:8080/:path*",
        // destination: "http://host.docker.internal:8080/:path*",
        // 도커 내부에서는 localhost가 React컨테이너 자신을 의미
        // destination: "http://backend:8080/:path*",
        // 쿠버네티스에서 localhost를 서비스명으로 지정 포트는 port를 지정
        destination: "http://boot001ser:8001/:path*",
      },
    ];
  },
};

export default nextConfig;
