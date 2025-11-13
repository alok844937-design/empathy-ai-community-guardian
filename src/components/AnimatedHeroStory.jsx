import React from "react";
import HeroSVG from "../../assets/hero_story.svg"; // if using CRA/Vite asset import

export default function AnimatedHeroStory() {
  return (
    <section className="py-12 bg-gray-50 flex justify-center">
      <div className="max-w-6xl w-full px-6">
        <div className="rounded-lg bg-white shadow-lg p-6">
          {/* If your bundler supports importing SVG as a React component, swap <img> for <HeroSVG /> */}
          <img src={HeroSVG} alt="Empathy AI story animation" className="w-full h-auto" />
        </div>
        <p className="mt-6 text-sm text-gray-500">
          Tip: Use the Lottie JSON for the highest-quality web integration or the MP4 for demos with voiceover.
        </p>
      </div>
    </section>
  );
}
