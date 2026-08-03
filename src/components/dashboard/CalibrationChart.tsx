"use client";

import {
  Bar,
  BarChart,
  CartesianGrid,
  Legend,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";
import type { CalibrationPoint } from "@/lib/dashboard";

export function CalibrationChart({ data }: { data: CalibrationPoint[] }) {
  const chartData = data.map((d) => ({
    label: d.label,
    "You said": d.statedPercent,
    "You scored": d.actualPercent ?? 0,
    count: d.count,
  }));

  return (
    <div>
      <div className="h-64" aria-hidden="true">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart data={chartData} margin={{ top: 8, right: 8, left: -16, bottom: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="var(--color-ink-100)" vertical={false} />
            <XAxis
              dataKey="label"
              tick={{ fill: "var(--color-ink-500)", fontSize: 12 }}
              axisLine={{ stroke: "var(--color-ink-200)" }}
              tickLine={false}
            />
            <YAxis
              domain={[0, 100]}
              tickFormatter={(v) => `${v}%`}
              tick={{ fill: "var(--color-ink-500)", fontSize: 12 }}
              axisLine={false}
              tickLine={false}
              width={44}
            />
            <Tooltip
              formatter={(value, name) => [`${value}%`, name]}
              contentStyle={{
                borderRadius: 12,
                border: "1px solid var(--color-ink-100)",
                fontSize: 13,
              }}
            />
            <Legend wrapperStyle={{ fontSize: 13 }} />
            <Bar dataKey="You said" fill="var(--color-ink-200)" radius={[6, 6, 0, 0]} />
            <Bar dataKey="You scored" fill="var(--color-teal-600)" radius={[6, 6, 0, 0]} />
          </BarChart>
        </ResponsiveContainer>
      </div>

      {/* Screen-reader-friendly text alternative to the chart above. */}
      <table className="sr-only">
        <caption>Stated confidence versus actual accuracy, by confidence level</caption>
        <thead>
          <tr>
            <th scope="col">Confidence level</th>
            <th scope="col">You said</th>
            <th scope="col">You scored</th>
            <th scope="col">Questions answered at this level</th>
          </tr>
        </thead>
        <tbody>
          {data.map((d) => (
            <tr key={d.confidence}>
              <th scope="row">{d.label}</th>
              <td>{d.statedPercent}%</td>
              <td>{d.actualPercent === null ? "No data yet" : `${d.actualPercent}%`}</td>
              <td>{d.count}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
