"use client";
import { useState } from "react";

export default function Home() {
  const [num1, setNum1] = useState(0);
  const [num2, setNum2] = useState(0);
  const [result, setResult] = useState(0);

  const sendPlus = async () => {
    try {
      const response = await fetch(
        `/boot/plus?num1=${Number(num1)}&num2=${Number(num2)}`
      );
      const data = await response.json();
      console.log("data:", data);
      setResult(data.sum);
    } catch (err) {
      console.error("Error fetching data:", err);
    }
  };

  return (
    <div className='plus'>
      <h1>덧셈 기능 만들기 (React)</h1>
      <label>num1: </label>
      <input
        type='number'
        value={num1}
        onChange={(e) => setNum1(Number(e.target.value))}
      />
      &nbsp;
      <label>num2: </label>
      <input
        type='number'
        value={num2}
        onChange={(e) => setNum2(Number(e.target.value))}
      />
      &nbsp;
      <button onClick={sendPlus}>더하기</button>
      <hr />
      <p>
        {num1} + {num2} = {result}
      </p>
    </div>
  );
}
