/** @type {import('next').NextConfig} */
const nextConfig = {
  async rewrites() {
    return [
      {
        source: "/boot/:path*",
        // destination: "http://localhost:8080/:path*",
        // destination: "http://host.docker.internal:8080/:path*",
        // 도커 내부에서는 localhost가 React컨테이너 자신을 의미
        destination: "http://boot001kube:8080/:path*",
      },
    ];
  },
};

export default nextConfig;
